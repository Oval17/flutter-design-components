// Reel 10 · Login Screen — glassmorphism on a gradient backdrop.

import 'dart:ui';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // gradient backdrop
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF9A9E), Color(0xFFA18CD1)],
              ),
            ),
          ),
          // soft blobs
          Positioned(
            top: -120, right: -80,
            child: _blob(const Color(0xFFFDE047), 360),
          ),
          Positioned(
            bottom: -100, left: -120,
            child: _blob(const Color(0xFFA78BFA), 420),
          ),
          // glass form
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  width: 340,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(36),
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Welcome back ✨',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                          )),
                      const SizedBox(height: 6),
                      const Text('Sign in to continue your journey',
                          style: TextStyle(color: Colors.white70, fontSize: 14)),
                      const SizedBox(height: 24),
                      _field(Icons.mail_outline, 'you@flutter.dev'),
                      const SizedBox(height: 14),
                      _field(Icons.lock_outline, '••••••••', obscure: true),
                      const SizedBox(height: 22),
                      _signInButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _blob(Color c, double size) => Container(
        width: size, height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: c.withOpacity(0.5),
        ),
      );

  Widget _field(IconData icon, String hint, {bool obscure = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
      ),
      child: Row(children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            obscureText: obscure,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              border: InputBorder.none,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _signInButton() => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFFEC4899)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7C3AED).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Text('Sign In →',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
      );
}
