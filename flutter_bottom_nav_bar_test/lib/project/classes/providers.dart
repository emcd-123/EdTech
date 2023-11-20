import 'package:flutter/material.dart';

class ScoreKeeperProvider extends ChangeNotifier {
  int requiredScore = 1;
  int totalScore = 0;

  void initializeReqScore(reqScore) {
    totalScore = 0;
    requiredScore = reqScore;
  }

  void addTotalScore() {
    totalScore += 1;
    notifyListeners();
  }

  void clearTotalScore() {
    totalScore = 0;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
