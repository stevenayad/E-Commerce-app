import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Anmationtext extends StatelessWidget {
  const Anmationtext({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            child: child,
            offset: Offset(0, 20 * (value - 1)),
          ),
        );
      },
      child: Column(
        children: [
          Text(
            "Fashion",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w300,
              letterSpacing: 8,
            ),
          ),
          Text(
            "STORE",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}
