import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.greenAccent, // Background color
            child: CustomPaint(
              painter: LudoBoardPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class LudoBoardPainter extends CustomPainter {
  final List<Color> topGridColors = List.generate(18, (index) {
    // Update colors based on indices
    if ([4, 5, 7, 10, 13, 16].contains(index)) {
      return Colors.yellow; // Yellow for specified indices in the top grid
    } else {
      return Colors.white; // White for other boxes
    }
  });

  final List<Color> bottomGridColors = List.generate(18, (index) {
    // Update colors based on indices
    if ([4, 5, 7, 10, 13, 16].contains(index)) {
      return Colors.blue; // Blue for specified indices in the bottom grid
    } else {
      return Colors.white; // White for other boxes
    }
  });

  final List<Color> leftGridColors = List.generate(18, (index) {
    // Update colors based on indices
    if ([4, 5, 7, 10, 13, 16].contains(index)) {
      return Colors.red; // Red for specified indices in the left grid
    } else {
      return Colors.white; // White for other boxes
    }
  });

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final greenPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final yellowPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    double squareSize = size.width * 2 / 5; // Size for the large squares
    double innerSquareSize = squareSize / 1.5; // Size for the inner white square
    double offset = (squareSize - innerSquareSize) / 2; // Center the inner square

    double topBoxWidth = size.width / 5; // Width of the top white box
    double topBoxHeight = size.height * 2 / 5; // Height of the top white box
    double topBoxOffsetX = (size.width - topBoxWidth) / 2; // Center horizontally
    double topBoxOffsetY = 0; // Top side of the container

    double bottomBoxWidth = size.width / 5; // Width of the bottom white box
    double bottomBoxHeight = size.height * 2 / 5; // Height of the bottom white box
    double bottomBoxOffsetX = (size.width - bottomBoxWidth) / 2; // Center horizontally
    double bottomBoxOffsetY = size.height - bottomBoxHeight; // Bottom side of the container

    double leftBoxWidth = size.width * 2 / 5; // Width of the left white box
    double leftBoxHeight = size.height / 5; // Height of the left white box
    double leftBoxOffsetX = 0; // Left side of the container
    double leftBoxOffsetY = (size.height - leftBoxHeight) / 2; // Center vertically

    // Draw the white boxes
    canvas.drawRect(
      Rect.fromLTWH(topBoxOffsetX, topBoxOffsetY, topBoxWidth, topBoxHeight),
      whitePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(topBoxOffsetX, topBoxOffsetY, topBoxWidth, topBoxHeight),
      borderPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(bottomBoxOffsetX, bottomBoxOffsetY, bottomBoxWidth, bottomBoxHeight),
      whitePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(bottomBoxOffsetX, bottomBoxOffsetY, bottomBoxWidth, bottomBoxHeight),
      borderPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(leftBoxOffsetX, leftBoxOffsetY, leftBoxWidth, leftBoxHeight),
      whitePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(leftBoxOffsetX, leftBoxOffsetY, leftBoxWidth, leftBoxHeight),
      borderPaint,
    );

    // Calculate size for each grid box
    double gridBoxWidthTopBottom = topBoxWidth / 3; // 3 columns for top/bottom boxes
    double gridBoxHeightTopBottom = topBoxHeight / 6; // 6 rows for top/bottom boxes
    double gridBoxWidthLeft = leftBoxWidth / 6; // 6 columns for left box
    double gridBoxHeightLeft = leftBoxHeight / 3; // 3 rows for left box

    // Draw grids
    void drawGrid(double offsetX, double offsetY, double boxWidth, double boxHeight, List<Color> colors, bool reverse) {
      for (int row = 0; row < 6; row++) {
        for (int col = 0; col < 3; col++) {
          int index = reverse ? (6 - row - 1) * 3 + (3 - col - 1) : row * 3 + col;
          double x = offsetX + col * boxWidth;
          double y = offsetY + row * boxHeight;

          final gridPaint = Paint()
            ..color = colors[index]
            ..style = PaintingStyle.fill;

          canvas.drawRect(
            Rect.fromLTWH(x, y, boxWidth, boxHeight),
            gridPaint,
          );
          canvas.drawRect(
            Rect.fromLTWH(x, y, boxWidth, boxHeight),
            borderPaint,
          );
        }
      }
    }

    void drawLeftGrid(double offsetX, double offsetY, double boxWidth, double boxHeight, List<Color> colors) {
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 6; col++) {
          int index = row * 6 + col;
          double x = offsetX + col * boxWidth;
          double y = offsetY + row * boxHeight;

          final gridPaint = Paint()
            ..color = colors[index]
            ..style = PaintingStyle.fill;

          canvas.drawRect(
            Rect.fromLTWH(x, y, boxWidth, boxHeight),
            gridPaint,
          );
          canvas.drawRect(
            Rect.fromLTWH(x, y, boxWidth, boxHeight),
            borderPaint,
          );
        }
      }
    }

    // Draw grids for each white box
    drawGrid(topBoxOffsetX, topBoxOffsetY, gridBoxWidthTopBottom, gridBoxHeightTopBottom, topGridColors, false);
    drawGrid(bottomBoxOffsetX, bottomBoxOffsetY, gridBoxWidthTopBottom, gridBoxHeightTopBottom, bottomGridColors, true);
    drawLeftGrid(leftBoxOffsetX, leftBoxOffsetY, gridBoxWidthLeft, gridBoxHeightLeft, leftGridColors);

    // Draw other squares (colored corners)
    _drawOtherSquares(canvas, size, squareSize, innerSquareSize, offset, redPaint, greenPaint, bluePaint, yellowPaint, whitePaint, borderPaint);
  }

  void _drawOtherSquares(Canvas canvas, Size size, double squareSize, double innerSquareSize, double offset, Paint redPaint, Paint greenPaint, Paint bluePaint, Paint yellowPaint, Paint whitePaint, Paint borderPaint) {
    // Draw each colored square and inner white square in each corner

    void drawSquare(double offsetX, double offsetY, Paint fillPaint) {
      canvas.drawRect(Rect.fromLTWH(offsetX, offsetY, squareSize, squareSize), fillPaint);
      canvas.drawRect(Rect.fromLTWH(offsetX, offsetY, squareSize, squareSize), borderPaint);
      canvas.drawRect(Rect.fromLTWH(offsetX + offset, offsetY + offset, innerSquareSize, innerSquareSize), whitePaint);
      canvas.drawRect(Rect.fromLTWH(offsetX + offset, offsetY + offset, innerSquareSize, innerSquareSize), borderPaint);
    }

    drawSquare(0, 0, redPaint); // Top-left
    drawSquare(size.width - squareSize, 0, greenPaint); // Top-right
    drawSquare(0, size.height - squareSize, bluePaint); // Bottom-left
    drawSquare(size.width - squareSize, size.height - squareSize, yellowPaint); // Bottom-right

    // Draw circles inside each white square
    _drawCircles(canvas, 0, 0, offset, innerSquareSize, Colors.red, borderPaint);
    _drawCircles(canvas, size.width - squareSize, 0, offset, innerSquareSize, Colors.yellow, borderPaint);
    _drawCircles(canvas, 0, size.height - squareSize, offset, innerSquareSize, Colors.blue, borderPaint);
    _drawCircles(canvas, size.width - squareSize, size.height - squareSize, offset, innerSquareSize, Colors.green, borderPaint);
  }

  void _drawCircles(Canvas canvas, double offsetX, double offsetY, double offset, double innerSquareSize, Color fillColor, Paint borderPaint) {
    double circleRadius = innerSquareSize / 6;
    double circleOffset = circleRadius * 1.5;

    final circlePaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    double topLeftX = offsetX + offset + circleOffset;
    double topLeftY = offsetY + offset + circleOffset;

    double topRightX = offsetX + offset + innerSquareSize - circleOffset;
    double topRightY = offsetY + offset + circleOffset;

    double bottomLeftX = offsetX + offset + circleOffset;
    double bottomLeftY = offsetY + offset + innerSquareSize - circleOffset;

    double bottomRightX = offsetX + offset + innerSquareSize - circleOffset;
    double bottomRightY = offsetY + offset + innerSquareSize - circleOffset;

    canvas.drawCircle(Offset(topLeftX, topLeftY), circleRadius, circlePaint);
    canvas.drawCircle(Offset(topLeftX, topLeftY), circleRadius, borderPaint);

    canvas.drawCircle(Offset(topRightX, topRightY), circleRadius, circlePaint);
    canvas.drawCircle(Offset(topRightX, topRightY), circleRadius, borderPaint);

    canvas.drawCircle(Offset(bottomLeftX, bottomLeftY), circleRadius, circlePaint);
    canvas.drawCircle(Offset(bottomLeftX, bottomLeftY), circleRadius, borderPaint);

    canvas.drawCircle(Offset(bottomRightX, bottomRightY), circleRadius, circlePaint);
    canvas.drawCircle(Offset(bottomRightX, bottomRightY), circleRadius, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
