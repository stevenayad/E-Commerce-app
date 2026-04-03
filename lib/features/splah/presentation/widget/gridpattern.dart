import 'package:flutter/widgets.dart';

class Gridpattern extends StatelessWidget {
  final Color color;
  const Gridpattern({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: Gridpainter(color: color));
  }
}

class Gridpainter extends CustomPainter {
  final Color color;
  const Gridpainter({required this.color});

  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = 0.5;

    final Spacing = 20.0;
    for (var i = 0.0; i < size.width; i += Spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += Spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  //improve preformance
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
