// Showcase entry point — opens a gallery of all designs in the project.

import 'package:flutter/material.dart';

import 'widgets/animated_fab.dart';
import 'widgets/glass_card.dart';
import 'widgets/neumorphic_button.dart';
import 'widgets/shimmer_loading.dart';
import 'widgets/smooth_toggle.dart';
import 'screens/login_screen.dart';
import 'animations/hero_demo.dart';
import 'animations/stagger_list.dart';
import 'animations/morphing_button.dart';
import 'tips/const_constructors.dart';
import 'tips/listview_builder.dart';
import 'tips/theme_extensions.dart';

void main() => runApp(const ReelsApp());

class ReelsApp extends StatelessWidget {
  const ReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reels',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const _Gallery(),
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery();

  static const _items = <_Item>[
    _Item('Animated FAB', 'widget'),
    _Item('Glass Card', 'widget'),
    _Item('Neumorphic Button', 'widget'),
    _Item('Shimmer Loading', 'widget'),
    _Item('Smooth Toggle', 'widget'),
    _Item('Login Screen', 'screen'),
    _Item('Hero Animation', 'anim'),
    _Item('Stagger List', 'anim'),
    _Item('Morphing Button', 'anim'),
    _Item('const constructors', 'tip'),
    _Item('ListView.builder', 'tip'),
    _Item('ThemeExtension', 'tip'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Reels — gallery')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, i) {
          final it = _items[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(it.cat[0].toUpperCase())),
              title: Text(it.title),
              subtitle: Text(it.cat),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _open(context, it),
            ),
          );
        },
      ),
    );
  }

  void _open(BuildContext ctx, _Item item) {
    Widget body;
    switch (item.title) {
      case 'Animated FAB':
        body = const Scaffold(floatingActionButton: AnimatedFab(), body: SizedBox.expand());
        break;
      case 'Glass Card':
        body = Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFFFF9A9E), Color(0xFFA18CD1)]),
          ),
          child: const Center(
            child: GlassCard(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('Glassmorphism 🪟',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
              ),
            ),
          ),
        );
        break;
      case 'Neumorphic Button':
        body = const Scaffold(body: Center(child: NeumorphicButton(child: Icon(Icons.favorite, color: Color(0xFF2563EB)))));
        break;
      case 'Shimmer Loading':
        body = const Scaffold(body: Padding(padding: EdgeInsets.all(16), child: SkeletonCard()));
        break;
      case 'Smooth Toggle':
        body = const _ToggleDemo();
        break;
      case 'Login Screen':
        body = const LoginScreen();
        break;
      case 'Hero Animation':
        body = const HeroDemo();
        break;
      case 'Stagger List':
        body = Scaffold(
          body: StaggerList(items: List.generate(15, (i) => 'Item ${i + 1}')),
        );
        break;
      case 'Morphing Button':
        body = Scaffold(
          body: Center(
            child: MorphingButton(
              label: 'Sign me up →',
              onPressed: () async => Future.delayed(const Duration(seconds: 2)),
            ),
          ),
        );
        break;
      case 'const constructors':
        body = const Scaffold(body: ConstTipExample());
        break;
      case 'ListView.builder':
        body = Scaffold(body: FastList(items: List.generate(200, (i) => 'Row ${i + 1}')));
        break;
      case 'ThemeExtension':
        body = const Scaffold(body: Padding(padding: EdgeInsets.all(16), child: SuccessBanner(message: 'Saved!')));
        break;
      default:
        body = const Scaffold(body: Center(child: Text('TODO')));
    }
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => body));
  }
}

class _Item {
  const _Item(this.title, this.cat);
  final String title;
  final String cat;
}

class _ToggleDemo extends StatefulWidget {
  const _ToggleDemo();
  @override
  State<_ToggleDemo> createState() => _ToggleDemoState();
}
class _ToggleDemoState extends State<_ToggleDemo> {
  bool _v = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SmoothToggle(
            value: _v,
            onChanged: (x) => setState(() => _v = x),
          ),
        ),
      );
}
