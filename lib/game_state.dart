import 'package:flutter/foundation.dart';

class GameState extends ChangeNotifier {
  int currentPlayer = 1;

  void switchPlayer() {
    currentPlayer = currentPlayer == 1 ? 2 : 1;
    notifyListeners();
  }
}



/*
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(LudoGameApp());
}

class LudoGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
*/