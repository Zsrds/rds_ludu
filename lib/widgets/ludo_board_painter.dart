import 'package:flutter/material.dart';
import '../model/player.dart';

class LudoBoardPainter extends CustomPainter {
  final List<Player> players;

  LudoBoardPainter({required this.players});

  @override
  void paint(Canvas canvas, Size size) {
    // Board painting logic here

    // খেলোয়াড়ের গুটিগুলো আঁকুন
    for (var player in players) {
      for (var position in player.positions) {
        drawToken(canvas, player.color, position, size);
      }
    }
  }

  void drawToken(Canvas canvas, Color color, int position, Size size) {
    // Token drawing logic here
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Token positioning logic based on position
    final double tokenSize = 20.0;
    final Offset tokenPosition = Offset(
        (position % 8) * 30.0, // Example calculation, adjust as necessary
        (position ~/ 8) * 30.0  // Example calculation, adjust as necessary
    );

    canvas.drawCircle(tokenPosition, tokenSize, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
