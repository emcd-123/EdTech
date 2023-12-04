import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';

import '../exercises/exercises.dart';
import '../libraries/page_templates.dart';
import 'database_classes.dart';

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

class MyPracticeReviewsProvider extends ChangeNotifier {
  List<Review> myPracticeReviews = [];
  late Review currentReview;

  //sets the reviews if empty
  void setReviews(List<Review> reviews) async {
    if (myPracticeReviews != []) {
      myPracticeReviews = reviews;
      myPracticeReviews.shuffle();
    }
  }

  List<Review> getReviews() {
    return myPracticeReviews;
  }

  //
  List<Container> getLessons(context) {
    // dev.log(myPracticeReviews[0].lessonName);
    List<Container> practiceLessons = [];

    for (int i = 0; i < myPracticeReviews.length; i++) {
      currentReview = myPracticeReviews[i];
      String exerciseIndex = currentReview.lessonName;
      int whichExercise = Random().nextInt(exercises[exerciseIndex]!.length);
      if (exercises[exerciseIndex]![whichExercise]["questionType"] ==
          "fillInTheBlank") {
        String img =
            exercises[exerciseIndex]![whichExercise]['image'] as String;
        if (img != "") {
          practiceLessons.add(templateFillInBlankQuestion(
              context, exercises[exerciseIndex]![whichExercise],
              reviewOrExtra: "r",
              lessonName: currentReview.lessonName,
              image: img));
        } else {
          practiceLessons.add(templateFillInBlankQuestion(
              context, exercises[exerciseIndex]![whichExercise],
              reviewOrExtra: "r", lessonName: currentReview.lessonName));
        }
      } else {
        practiceLessons.add(Container(
            child: const Text("Error: question type unaccounted for")));
      }
    }

    return practiceLessons;
  }

  void clear() {
    myPracticeReviews = [];
  }

  void refresh() {
    notifyListeners();
  }
}
