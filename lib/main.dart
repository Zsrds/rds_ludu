// lib/main.dart
import 'package:flutter/material.dart';

import 'game/ludu_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Game',
      home: LudoGame(),
    );
  }
}