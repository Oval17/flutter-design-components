# Source code

Real, runnable Flutter widgets — one file per design. Drop any file into your `lib/` and it works.

```
lib/
├── widgets/      ← reusable building blocks (FAB, card, toggle, …)
├── screens/      ← full-screen layouts (login, profile, music, …)
├── animations/   ← animation patterns (hero, stagger, morph, …)
└── tips/         ← perf & Dart tips with runnable examples
```

## Run the showcase app

```bash
cd code
flutter pub get
flutter run
```

The showcase is `lib/main.dart` — a tabbed gallery showing every design.

## Use a single widget in your own app

```dart
import 'package:flutter_reels/widgets/animated_fab.dart';

Scaffold(
  floatingActionButton: const AnimatedFab(),
  ...
)
```
