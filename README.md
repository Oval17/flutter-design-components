# Flutter Design Reels — 100 widgets, screens, animations & tips

> A pack of 100 Flutter UI designs — beautifully animated, ready to copy, free to use. Each design ships with its own video reel and source code.

[![Flutter](https://img.shields.io/badge/Flutter-3.27-blue?logo=flutter)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## What's inside

```
flutter-reels/
├── flutter-reels.html     ← Live preview of all 100 designs (open in browser)
├── render.sh / render.js  ← One-command renderer → 100 × 10s MP4s
├── CAPTIONS.md            ← Instagram / YouTube / Twitter post copy
├── code/                  ← Real Dart/Flutter source
│   ├── lib/
│   │   ├── reels/         ← 100 self-contained Flutter UI designs (001–100)
│   │   ├── widgets/       ← Individual widgets: animated FAB, glass card, …
│   │   ├── screens/       ← Full screens: login, onboarding, profile, …
│   │   ├── animations/    ← Hero, stagger, morph, liquid swipe, …
│   │   └── tips/          ← const, ListView.builder, slivers, theme exts, …
│   └── pubspec.yaml
└── videos/                ← Rendered MP4s (after running render.sh)
```

## 100 designs

| # | Category | Title |
|--|--|--|
| 01 | WIDGET | Animated FAB |
| 02 | WIDGET | Glassmorphism Card |
| 03 | WIDGET | Neumorphic Button |
| 04 | WIDGET | Gradient AppBar |
| 05 | WIDGET | Custom Slider |
| 06 | WIDGET | Animated Bottom Nav |
| 07 | WIDGET | Shimmer Loading |
| 08 | WIDGET | Smooth Toggle |
| 09 | WIDGET | Floating Search |
| 10 | SCREEN | Login Screen |
| 11 | SCREEN | Onboarding |
| 12 | SCREEN | Profile |
| 13 | SCREEN | Music Player |
| 14 | SCREEN | Weather |
| 15 | SCREEN | Banking App |
| 16 | SCREEN | Chat UI |
| 17 | SCREEN | Shopping Cart |
| 18 | SCREEN | Settings |
| 19 | SCREEN | Fitness Tracker |
| 20 | ANIM | Hero Animation |
| 21 | ANIM | Page Transition |
| 22 | ANIM | Stagger Animation |
| 23 | ANIM | Custom Loader |
| 24 | ANIM | Confetti Burst |
| 25 | ANIM | Parallax Scroll |
| 26 | ANIM | 3D Card Flip |
| 27 | ANIM | Morphing Button |
| 28 | ANIM | Liquid Swipe |
| 29 | ANIM | Bouncing Grid |
| 30 | TIP | Use const constructors |
| 31 | TIP | ListView.builder |
| 32 | TIP | Hot reload vs restart |
| 33 | TIP | Slivers for scroll |
| 34 | TIP | Riverpod basics |
| 35 | TIP | Dart records |
| 36 | TIP | Theme extensions |
| 37 | WIDGET | OTP Input |
| 38 | WIDGET | Swipe Cards |
| 39 | WIDGET | Day / Night Switch |
| 40 | WIDGET | Pull to Refresh |
| 41 | WIDGET | Sliding Tabs |
| 42 | WIDGET | Animated Snackbar |
| 43 | WIDGET | Radial FAB Menu |
| 44 | WIDGET | Star Rating |
| 45 | WIDGET | Calendar View |
| 46 | WIDGET | Bottom Sheet |
| 47 | WIDGET | Image Carousel |
| 48 | WIDGET | Notifications |
| 49 | SCREEN | Settings Drawer |
| 50 | SCREEN | Empty State |
| 51 | SCREEN | Step Wizard |
| 52 | WIDGET | Voice Recorder |
| 53 | SCREEN | Photo Gallery |
| 54 | WIDGET | Color Picker |
| 55 | WIDGET | Toast Stack |
| 56 | SCREEN | Map View |
| 57 | SCREEN | Activity Timeline |
| 58 | WIDGET | Date Picker |
| 59 | WIDGET | Search Filters |
| 60 | SCREEN | Analytics Dashboard |
| 61 | SCREEN | Edit Profile |
| 62 | ANIM | Verified Badge |
| 63 | WIDGET | Drag to Reorder |
| 64 | WIDGET | QR Scanner |
| 65 | SCREEN | Album List |
| 66 | SCREEN | Recipe Card |
| 67 | WIDGET | Workout Timer |
| 68 | SCREEN | Habit Tracker |
| 69 | WIDGET | Mood Selector |
| 70 | WIDGET | Pricing Card |
| 71 | SCREEN | Wallet |
| 72 | WIDGET | Coupon Card |
| 73 | SCREEN | Stock Ticker |
| 74 | WIDGET | Crypto Card |
| 75 | WIDGET | Voice Assistant |
| 76 | SCREEN | AI Chat |
| 77 | SCREEN | Camera |
| 78 | WIDGET | Volume Slider |
| 79 | WIDGET | Brightness |
| 80 | WIDGET | Battery |
| 81 | SCREEN | Lock Screen |
| 82 | ANIM | Biometric Unlock |
| 83 | SCREEN | Splash Screen |
| 84 | SCREEN | 404 Page |
| 85 | WIDGET | FAQ Accordion |
| 86 | WIDGET | Cookie Banner |
| 87 | WIDGET | Upgrade Prompt |
| 88 | ANIM | Achievement Unlock |
| 89 | ANIM | Level Up |
| 90 | WIDGET | Streak Counter |
| 91 | WIDGET | Reaction Picker |
| 92 | WIDGET | Mention Picker |
| 93 | WIDGET | Send Message |
| 94 | WIDGET | Tooltip |
| 95 | WIDGET | Avatar Group |
| 96 | WIDGET | Status Indicators |
| 97 | WIDGET | Confirm Dialog |
| 98 | SCREEN | Progress Dots |
| 99 | WIDGET | Permission Prompt |
| 100 | ANIM | 100th Reel 💯 |

## Quick start

**Preview the designs**

```bash
open flutter-reels.html
```

**Render all 100 as MP4s (for Reels/Shorts/TikTok)**

```bash
brew install ffmpeg          # one-time
./render.sh                  # produces ./videos/reel-01.mp4 … reel-100.mp4
```

Output: 100 × 10-second 1080×1920 MP4s, ready to post.

**Use a widget in your own Flutter app**

```bash
cp code/lib/widgets/animated_fab.dart ~/my-app/lib/
```

Each file is a self-contained widget. Drop it in, import it, use it.


## License

MIT — use, modify, ship in commercial work. A star or credit is appreciated but not required.

## Acknowledgements

Built with [Flutter](https://flutter.dev), [Dart](https://dart.dev), and a lot of `BoxShadow`.
