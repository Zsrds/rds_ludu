import 'package:flutter/material.dart';

class PlayerBox extends StatelessWidget {
  final Color outerBoxColor;
  final Color innerBoxColor;
  final Color circleColor;
  final double outerBoxSize;
  final double innerBoxSize;
  final double circleSize;

  PlayerBox({
    required this.outerBoxColor,
    required this.innerBoxColor,
    required this.circleColor,
    required this.outerBoxSize,
    required this.innerBoxSize,
    required this.circleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: outerBoxSize,
      height: outerBoxSize,
      decoration: BoxDecoration(
        color: outerBoxColor,
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Center(
        child: Container(
          width: innerBoxSize,
          height: innerBoxSize,
          decoration: BoxDecoration(
            color: innerBoxColor,
            border: Border.all(color: Colors.black, width: 2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: BorderRadius.circular(circleSize / 2),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                  ),
                  SizedBox(height: innerBoxSize / 4),
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: BorderRadius.circular(circleSize / 2),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                  ),
                ],
              ),
              SizedBox(width: innerBoxSize / 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: BorderRadius.circular(circleSize / 2),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                  ),
                  SizedBox(height: innerBoxSize / 4),
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: BorderRadius.circular(circleSize / 2),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
