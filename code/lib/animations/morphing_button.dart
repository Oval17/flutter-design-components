// Reel 27 · Morphing Button — idle → loading → success in one AnimatedContainer.

import 'package:flutter/material.dart';

enum MorphState { idle, loading, success }

class MorphingButton extends StatefulWidget {
  const MorphingButton({super.key, required this.label, required this.onPressed});
  final String label;
  final Future<void> Function() onPressed;

  @override
  State<MorphingButton> createState() => _MorphingButtonState();
}

class _MorphingButtonState extends State<MorphingButton> {
  MorphState _state = MorphState.idle;

  Future<void> _run() async {
    if (_state != MorphState.idle) return;
    setState(() => _state = MorphState.loading);
    try {
      await widget.onPressed();
      if (!mounted) return;
      setState(() => _state = MorphState.success);
      await Future.delayed(const Duration(milliseconds: 900));
      if (!mounted) return;
      setState(() => _state = MorphState.idle);
    } catch (_) {
      setState(() => _state = MorphState.idle);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isIdle = _state == MorphState.idle;
    final isSuccess = _state == MorphState.success;
    return GestureDetector(
      onTap: _run,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        height: 56,
        width: isIdle ? 220 : 56,
        decoration: BoxDecoration(
          color: isSuccess ? const Color(0xFF10B981) : const Color(0xFF2563EB),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: (isSuccess ? const Color(0xFF10B981) : const Color(0xFF2563EB))
                  .withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(child: _innerForState()),
      ),
    );
  }

  Widget _innerForState() {
    switch (_state) {
      case MorphState.idle:
        return Text(widget.label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16));
      case MorphState.loading:
        return const SizedBox(
          width: 24, height: 24,
          child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white),
        );
      case MorphState.success:
        return const Icon(Icons.check, color: Colors.white, size: 28);
    }
  }
}
