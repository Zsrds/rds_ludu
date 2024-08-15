import 'package:flutter/material.dart';
import 'package:ludu/widgets/dice.dart';
import 'package:ludu/widgets/index_left-right.dart';
import 'widgets/playerbox.dart';
import 'widgets/index_top.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final boxSize = screenSize.width * 0.9; // 60% of the screen width
    final playerBoxSize = boxSize * 0.4; // 40% of the box size

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.indigo,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  //color: Colors.lightGreen,
                  child: Dice(),
                ),
                SizedBox(height: 10,),
                Container(
                  width: boxSize,
                  height: boxSize,
                  color: Colors.deepOrange,
                  child: Stack(
                    children: <Widget>[
                      // Top-left corner player 1 Color: Red
                      Positioned(
                        left: 0,
                        top: 0,
                        child: PlayerBox(
                          outerBoxColor: Colors.red,
                          innerBoxColor: Colors.white,
                          circleColor: Colors.red,
                          outerBoxSize: playerBoxSize,
                          innerBoxSize: playerBoxSize * 0.67,
                          circleSize: playerBoxSize * 0.17,
                        ),
                      ),
                      // Top-right corner player 2 Color: Blue
                      Positioned(
                        right: 0,
                        top: 0,
                        child: PlayerBox(
                          outerBoxColor: Colors.blue,
                          innerBoxColor: Colors.white,
                          circleColor: Colors.blue,
                          outerBoxSize: playerBoxSize,
                          innerBoxSize: playerBoxSize * 0.67,
                          circleSize: playerBoxSize * 0.17,
                        ),
                      ),
                      // Bottom-left corner player 3 Color: Yellow
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: PlayerBox(
                          outerBoxColor: Colors.yellow,
                          innerBoxColor: Colors.white,
                          circleColor: Colors.yellow,
                          outerBoxSize: playerBoxSize,
                          innerBoxSize: playerBoxSize * 0.67,
                          circleSize: playerBoxSize * 0.17,
                        ),
                      ),
                      // Bottom-right corner player 4 Color: Green
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: PlayerBox(
                          outerBoxColor: Colors.green,
                          innerBoxColor: Colors.white,
                          circleColor: Colors.green,
                          outerBoxSize: playerBoxSize,
                          innerBoxSize: playerBoxSize * 0.67,
                          circleSize: playerBoxSize * 0.17,
                        ),
                      ),
                      // Rotate IndexTop by 0 degrees and place in the top center
                      Align(
                        alignment: Alignment.topCenter,
                        child: Transform.rotate(
                          angle: 0 * 3.14159 / 180, // 0 degrees in radians
                          child: IndexTop(
                            redColor: Colors.blue,
                            whiteColor: Colors.white,
                            width: boxSize * 0.2, // Relative width
                            height: boxSize * 0.4, // Relative height
                          ),
                        ),
                      ),
                      // Rotate IndexTop by 90 degrees and place in the top center
                      Align(
                        alignment: Alignment.centerRight,
                        child: Transform.rotate(
                          angle: 180 * 3.14159 / 180, // 90 degrees in radians
                          child: IndexLeftRight(
                            redColor: Colors.green,
                            whiteColor: Colors.white,
                            width: boxSize * 0.4, // Relative width
                            height: boxSize * 0.2, // Relative height
                          ),
                        ),
                      ),
                      // Rotate IndexTop by 180 degrees and place in the bottom center
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.rotate(
                          angle: 180 * 3.14159 / 180, // 180 degrees in radians
                          child: IndexTop(
                            redColor: Colors.yellow,
                            whiteColor: Colors.white,
                            width: boxSize * 0.2, // Relative width
                            height: boxSize * 0.4, // Relative height
                          ),
                        ),
                      ),
                      // Rotate IndexTop by 270 degrees and place in the left center
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Transform.rotate(
                          angle: 0 * 3.14159 / 180, // 270 degrees in radians
                          child: IndexLeftRight(
                            redColor: Colors.red,
                            whiteColor: Colors.white,
                            width: boxSize * 0.4, // Relative width
                            height: boxSize * 0.2, // Relative height
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
