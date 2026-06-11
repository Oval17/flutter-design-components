#!/usr/bin/env node
/**
 * Flutter Reels  ·  bulk renderer  (v2, disk-buffered)
 *
 * Renders 100 × 10s 1080×1920 MP4s from flutter-reels.html.
 * Captures CDP screencast frames to a temp dir, then encodes
 * each reel with ffmpeg.  No piping = no EPIPE.
 *
 *   node render.js              # all 100
 *   node render.js 0            # just reel #1
 *   node render.js 0 5          # reels 1..6
 *
 * Requirements:
 *   • macOS / Linux / Windows with Google Chrome installed
 *   • ffmpeg in PATH    (brew install ffmpeg)
 *   • npm install puppeteer-core
 */

const puppeteer = require('puppeteer-core');
const fs = require('fs');
const path = require('path');
const os = require('os');
const { spawn } = require('child_process');

const HTML = path.resolve(__dirname, 'flutter-reels.html');
const OUT_DIR = path.resolve(__dirname, 'videos');
const TMP_DIR = path.resolve(__dirname, '.frames');
const TOTAL = 100;
const DURATION = 10;          // seconds per reel
const FPS = 30;               // output framerate

function chromePath() {
  if (process.env.CHROME) return process.env.CHROME;
  const plat = os.platform();
  const candidates = {
    darwin: [
      '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
      '/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary',
      '/Applications/Chromium.app/Contents/MacOS/Chromium',
      '/Applications/Brave Browser.app/Contents/MacOS/Brave Browser',
    ],
    linux: ['/usr/bin/google-chrome', '/usr/bin/chromium-browser', '/usr/bin/chromium'],
    win32: [
      'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe',
      'C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe',
    ],
  }[plat] || [];
  for (const c of candidates) if (fs.existsSync(c)) return c;
  throw new Error('Could not find Chrome. Set CHROME env var.');
}

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

function runFfmpeg(args) {
  return new Promise((resolve, reject) => {
    const ff = spawn('ffmpeg', args, { stdio: ['ignore', 'ignore', 'pipe'] });
    let stderr = '';
    ff.stderr.on('data', (d) => (stderr += d.toString()));
    ff.on('error', reject);
    ff.on('exit', (code) => {
      if (code === 0) resolve();
      else reject(new Error(`ffmpeg exited ${code}\n${stderr.slice(-1500)}`));
    });
  });
}

async function renderReel(browser, idx) {
  const num = String(idx + 1).padStart(2, '0');
  const outFile = path.join(OUT_DIR, `reel-${num}.mp4`);
  const frameDir = path.join(TMP_DIR, `reel-${num}`);
  process.stdout.write(`  · reel ${num}/${TOTAL}  → ${path.basename(outFile)}\n`);

  fs.rmSync(frameDir, { recursive: true, force: true });
  fs.mkdirSync(frameDir, { recursive: true });

  const page = await browser.newPage();
  await page.setViewport({ width: 1080, height: 1920, deviceScaleFactor: 1 });

  const url = `file://${HTML}?render=${idx}`;
  await page.goto(url, { waitUntil: 'networkidle0', timeout: 30000 });
  await page.waitForFunction('window.__reelReady === true', { timeout: 10000 });
  await sleep(400);

  // ---- capture frames to disk via CDP screencast ----
  const client = await page.target().createCDPSession();
  let stopped = false;
  let frameIdx = 0;
  const startTime = Date.now();

  client.on('Page.screencastFrame', async ({ data, sessionId }) => {
    if (stopped) return;
    try {
      const name = `f${String(frameIdx++).padStart(5, '0')}.jpg`;
      fs.writeFileSync(path.join(frameDir, name), Buffer.from(data, 'base64'));
    } catch (_) {}
    try {
      await client.send('Page.screencastFrameAck', { sessionId });
    } catch (_) {}
  });

  await client.send('Page.startScreencast', {
    format: 'jpeg',
    quality: 92,
    maxWidth: 1080,
    maxHeight: 1920,
    everyNthFrame: 1,
  });

  await sleep(DURATION * 1000 + 300);

  stopped = true;
  try { await client.send('Page.stopScreencast'); } catch (_) {}
  await sleep(150);

  const elapsed = (Date.now() - startTime) / 1000;
  const inFps = Math.max(1, Math.round(frameIdx / elapsed));
  process.stdout.write(`      captured ${frameIdx} frames (~${inFps}fps)\n`);

  await page.close();

  if (frameIdx === 0) throw new Error('no frames captured — Chrome may not be rendering');

  // ---- encode ----
  await runFfmpeg([
    '-y',
    '-loglevel', 'error',
    '-framerate', String(inFps),
    '-i', path.join(frameDir, 'f%05d.jpg'),
    '-vf', `fps=${FPS},scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:black`,
    '-t', String(DURATION),
    '-r', String(FPS),
    '-c:v', 'libx264',
    '-pix_fmt', 'yuv420p',
    '-crf', '20',
    '-preset', 'medium',
    '-movflags', '+faststart',
    outFile,
  ]);

  fs.rmSync(frameDir, { recursive: true, force: true });
}

async function main() {
  const [aRaw, bRaw] = process.argv.slice(2);
  const a = aRaw !== undefined ? parseInt(aRaw, 10) : 0;
  const b = bRaw !== undefined ? parseInt(bRaw, 10) : TOTAL - 1;

  if (!fs.existsSync(HTML)) {
    console.error(`× flutter-reels.html not found at ${HTML}`);
    process.exit(1);
  }
  fs.mkdirSync(OUT_DIR, { recursive: true });
  fs.mkdirSync(TMP_DIR, { recursive: true });

  const exe = chromePath();
  console.log(`▶ rendering ${b - a + 1} reel(s) using ${path.basename(exe)}`);
  console.log(`  output → ${OUT_DIR}\n`);

  const browser = await puppeteer.launch({
    executablePath: exe,
    headless: 'new',
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--hide-scrollbars',
      '--disable-web-security',
      '--allow-file-access-from-files',
      '--window-size=1080,1920',
      '--force-device-scale-factor=1',
    ],
    defaultViewport: null,
  });

  const t0 = Date.now();
  for (let i = a; i <= b; i++) {
    try {
      await renderReel(browser, i);
    } catch (e) {
      console.error(`    × failed reel ${i + 1}: ${e.message}`);
    }
  }
  await browser.close();
  try { fs.rmSync(TMP_DIR, { recursive: true, force: true }); } catch (_) {}

  const secs = ((Date.now() - t0) / 1000).toFixed(1);
  console.log(`\n✓ done in ${secs}s. Files in ${OUT_DIR}`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
