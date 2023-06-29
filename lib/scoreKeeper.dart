import 'package:flutter/material.dart';

class ScoreKeeper {
  List<Icon> scoreKeepers = [];
  void correct() {
    scoreKeepers.add(const Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  void wrong() {
    scoreKeepers.add(const Icon(
      Icons.close,
      color: Colors.red,
    ));
  }
  void resetmarkers(){
     scoreKeepers = [];
  }
}
