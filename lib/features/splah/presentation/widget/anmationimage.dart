

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationImge extends StatelessWidget {
  const AnimationImge({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: value,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.shopping_bag_outlined,
          size: 48,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
