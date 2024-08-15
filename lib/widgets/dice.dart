import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  final GlobalKey<_DiceState> key;

  Dice({required this.key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin {
  int _side = 1;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });
    _rotationAnimation = Tween<double>(begin: 0, end: 4 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );
  }

  void _rollDice() {
    setState(() {
      _side = Random().nextInt(6) + 1; // Final result after rolling
    });
    _controller.forward(from: 0).then((_) {
      _controller.reverse();
    });
  }

  int getSide() {
    return _side;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rollDice,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Transform.scale(
            scale: _bounceAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: CustomPaint(
                size: Size(100, 100),
                painter: DicePainter(side: _side),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DicePainter extends CustomPainter {
  final int side;
  DicePainter({required this.side});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final radius = size.width / 8;

    paint.color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(12)),
      paint,
    );

    final center = size.center(Offset.zero);

    void drawDot(double x, double y) {
      canvas.drawCircle(Offset(x, y), radius, dotPaint);
    }

    switch (side) {
      case 1:
        drawDot(center.dx, center.dy);
        break;
      case 2:
        drawDot(center.dx - radius * 2, center.dy);
        drawDot(center.dx + radius * 2, center.dy);
        break;
      case 3:
        drawDot(center.dx - radius * 2, center.dy - radius * 2);
        drawDot(center.dx, center.dy);
        drawDot(center.dx + radius * 2, center.dy + radius * 2);
        break;
      case 4:
        drawDot(center.dx - radius * 2, center.dy - radius * 2);
        drawDot(center.dx + radius * 2, center.dy - radius * 2);
        drawDot(center.dx - radius * 2, center.dy + radius * 2);
        drawDot(center.dx + radius * 2, center.dy + radius * 2);
        break;
      case 5:
        drawDot(center.dx - radius * 2, center.dy - radius * 2);
        drawDot(center.dx + radius * 2, center.dy - radius * 2);
        drawDot(center.dx, center.dy);
        drawDot(center.dx - radius * 2, center.dy + radius * 2);
        drawDot(center.dx + radius * 2, center.dy + radius * 2);
        break;
      case 6:
        drawDot(center.dx - radius * 2, center.dy - radius * 2);
        drawDot(center.dx, center.dy - radius * 2);
        drawDot(center.dx + radius * 2, center.dy - radius * 2);
        drawDot(center.dx - radius * 2, center.dy + radius * 2);
        drawDot(center.dx, center.dy + radius * 2);
        drawDot(center.dx + radius * 2, center.dy + radius * 2);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
