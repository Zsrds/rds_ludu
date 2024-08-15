// lib/game/ludo_game.dart
import 'package:flutter/material.dart';

import '../model/player.dart';
import '../test.dart';
import '../widgets/dice.dart';


class LudoGame extends StatefulWidget {
  @override
  _LudoGameState createState() => _LudoGameState();
}

class _LudoGameState extends State<LudoGame> {
  final List<Player> players = [
    Player(name: 'Player 1', color: Colors.red),
    Player(name: 'Player 2', color: Colors.green),
    Player(name: 'Player 3', color: Colors.yellow),
    Player(name: 'Player 4', color: Colors.blue),
  ];

  final Dice dice = Dice();
  int currentPlayerIndex = 0;

  void rollDice() {
    setState(() {
      int diceValue = dice.getSide(); // Get the current side of the dice
      movePlayer(players[currentPlayerIndex], diceValue);

      // পরবর্তী খেলোয়াড়
      currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
    });
  }

  void movePlayer(Player player, int diceValue) {
    // প্রথম গুটি সরানোর লজিক
    player.positions[0] += diceValue;

    // যদি একটি গুটি বোর্ডের বাইরে চলে যায়
    if (player.positions[0] >= 52) {
      player.positions[0] = 52; // শেষ পজিশন
    }

    // অন্যান্য গুটির জন্য লজিক প্রয়োগ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: LudoBoardPainter(players: players),
          ),
          // ডাইস রোল বাটন
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: rollDice,
              child: Text('Roll Dice'),
            ),
          ),
        ],
      ),
    );
  }
}