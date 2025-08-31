import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/splah/presentation/widget/anmationbottomtext.dart';
import 'package:flutter_application_1/splah/presentation/widget/anmationimage.dart';
import 'package:flutter_application_1/splah/presentation/widget/anmationtext.dart';
import 'package:flutter_application_1/splah/presentation/widget/gridpattern.dart';

class Splahviewbody extends StatelessWidget {
  const Splahviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.6),
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Gridpattern(color: Colors.white),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  builder: (context, value, child) {
                    return AnimationImge(value: value);
                  },
                ),
                //Animation text
                Anmationtext(),
                const SizedBox(height: 32),
              ],
            ),
          ),
          //Anmation bottom Text
          Anmationbottomtext(),
        ],
      ),
    );
  }
}
