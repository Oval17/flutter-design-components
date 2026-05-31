# Flutter Design Reels — 36 widgets, screens, animations & tips

> A pack of 36 Flutter UI designs — beautifully animated, ready to copy, free to use. Each design ships with its own video reel and source code.

[![Flutter](https://img.shields.io/badge/Flutter-3.27-blue?logo=flutter)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## What's inside

```
flutter-reels/
├── flutter-reels.html     ← Live preview of all 36 designs (open in browser)
├── render.sh / render.js  ← One-command renderer → 36 × 10s MP4s
├── CAPTIONS.md            ← Instagram / YouTube / Twitter post copy
├── code/                  ← Real Dart/Flutter source
│   ├── lib/
│   │   ├── widgets/       ← Animated FAB, glass card, neumorphic button, …
│   │   ├── screens/       ← Login, onboarding, profile, music player, …
│   │   ├── animations/    ← Hero, stagger, morph, liquid swipe, …
│   │   └── tips/          ← const, ListView.builder, slivers, theme exts, …
│   └── pubspec.yaml
└── videos/                ← Rendered MP4s (after running render.sh)
```

## 36 designs

| # | Category | Title |
|--|--|--|
| 01 | Widget | Animated FAB |
| 02 | Widget | Glassmorphism Card |
| 03 | Widget | Neumorphic Button |
| 04 | Widget | Gradient AppBar |
| 05 | Widget | Custom Slider |
| 06 | Widget | Animated Bottom Nav |
| 07 | Widget | Shimmer Loading |
| 08 | Widget | Smooth Toggle |
| 09 | Widget | Floating Search |
| 10 | Screen | Login Screen |
| 11 | Screen | Onboarding |
| 12 | Screen | Profile |
| 13 | Screen | Music Player |
| 14 | Screen | Weather |
| 15 | Screen | Banking App |
| 16 | Screen | Chat UI |
| 17 | Screen | Shopping Cart |
| 18 | Screen | Settings |
| 19 | Screen | Fitness Tracker |
| 20 | Animation | Hero |
| 21 | Animation | Page Transition |
| 22 | Animation | Stagger List |
| 23 | Animation | Custom Loader |
| 24 | Animation | Confetti Burst |
| 25 | Animation | Parallax Scroll |
| 26 | Animation | 3D Card Flip |
| 27 | Animation | Morphing Button |
| 28 | Animation | Liquid Swipe |
| 29 | Animation | Bouncing Grid |
| 30 | Tip | `const` constructors |
| 31 | Tip | `ListView.builder` |
| 32 | Tip | Hot reload vs restart |
| 33 | Tip | Slivers for scroll |
| 34 | Tip | Riverpod basics |
| 35 | Tip | Dart records |
| 36 | Tip | ThemeExtension |

## Quick start

**Preview the designs**

```bash
open flutter-reels.html
```

**Render all 36 as MP4s (for Reels/Shorts/TikTok)**

```bash
brew install ffmpeg          # one-time
./render.sh                  # produces ./videos/reel-01.mp4 … reel-36.mp4
```

Output: 36 × 10-second 1080×1920 MP4s, ready to post.

**Use a widget in your own Flutter app**

```bash
cp code/lib/widgets/animated_fab.dart ~/my-app/lib/
```

Each file is a self-contained widget. Drop it in, import it, use it.

## Posting these on social

`CAPTIONS.md` includes a ready-to-paste caption for every reel — across Instagram, YouTube Shorts, and Twitter/X — with hashtags, hooks, and a 36-day posting schedule.

## License

MIT — use, modify, ship in commercial work. A star or credit is appreciated but not required.

## Acknowledgements

Built with [Flutter](https://flutter.dev), [Dart](https://dart.dev), and a lot of `BoxShadow`.
