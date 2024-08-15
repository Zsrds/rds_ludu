// lib/models/player.dart
import 'package:flutter/material.dart';

class Player {
  final String name;
  final Color color;
  List<int> positions = [0, 0, 0, 0]; // গুটির শুরুর অবস্থান

  Player({required this.name, required this.color});
}