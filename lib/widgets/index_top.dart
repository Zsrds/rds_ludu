import 'package:flutter/material.dart';

class IndexTop extends StatelessWidget {
  final Color redColor;
  final Color whiteColor;
  final double width;
  final double height;

  IndexTop({
    required this.redColor,
    required this.whiteColor,
    this.width = 120.0,
    this.height = 240.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columns
          childAspectRatio: 1.0, // Make the boxes square
          crossAxisSpacing: 0.0, // No space between columns
          mainAxisSpacing: 0.0, // No space between rows
        ),
        itemCount: 18, // Total 18 boxes
        itemBuilder: (context, index) {
          // List of indices that should be red
          List<int> redIndices = [4, 5, 7, 10, 13, 16];

          // Determine borders for each cell
          BorderSide topBorder = BorderSide.none;
          BorderSide bottomBorder = BorderSide.none;
          BorderSide leftBorder = BorderSide.none;
          BorderSide rightBorder = BorderSide.none;

          // Set borders based on index
          if ([].contains(index)) {
            bottomBorder = BorderSide.none;
          } else {
            bottomBorder = BorderSide(color: Colors.black, width: 2.0);
          }

          if ([2, 5, 8, 11, 14, 17].contains(index)) {
            rightBorder = BorderSide.none;
          } else {
            rightBorder = BorderSide(color: Colors.black, width: 2.0);
          }

          if ([3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17].contains(index)) {
            topBorder = BorderSide.none;
          } else {
            topBorder = BorderSide(color: Colors.black, width: 2.0);
          }

          if ([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17].contains(index)) {
            leftBorder = BorderSide.none;
          } else {
            leftBorder = BorderSide(color: Colors.black, width: 2.0);
          }

          return Container(
            decoration: BoxDecoration(
              color: redIndices.contains(index) ? redColor : whiteColor,
              border: Border(
                top: topBorder,
                bottom: bottomBorder,
                left: leftBorder,
                right: rightBorder,
              ),
            ),
            child: Center(
              child: Text(
                '${index + 1}', // Display the index + 1
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
