// Tip 30 · Use `const` constructors
//
// Mark widgets `const` when their inputs are compile-time constants.
// Flutter caches the widget instance forever and skips rebuilds.
// Free 10–30% perf for 6 characters.

import 'package:flutter/material.dart';

class ConstTipExample extends StatefulWidget {
  const ConstTipExample({super.key});

  @override
  State<ConstTipExample> createState() => _ConstTipExampleState();
}

class _ConstTipExampleState extends State<ConstTipExample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ❌ rebuilds every time _counter changes
        Text('Hello'),

        // ✅ cached forever — Flutter knows this never changes
        const Text('Hello'),

        const SizedBox(height: 20),

        // ✅ children of dynamic widgets can still be const
        Padding(
          padding: const EdgeInsets.all(20),                 // const
          child: Column(
            children: const [                                 // const literal list
              Text('I never rebuild'),
              SizedBox(height: 12),
              Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
        ),

        ElevatedButton(
          onPressed: () => setState(() => _counter++),
          child: Text('Tapped $_counter times'),              // not const — depends on state
        ),
      ],
    );
  }
}

// Rule of thumb:
//   • If a widget's params don't depend on runtime state → `const`.
//   • Turn on the `prefer_const_constructors` lint (it's in flutter_lints).
//   • The IDE will literally show you which ones you're missing.
