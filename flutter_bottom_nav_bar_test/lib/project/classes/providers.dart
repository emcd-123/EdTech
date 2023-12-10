import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/file_IO.dart';
import 'package:path_provider/path_provider.dart';

import '../exercises/exercises.dart';
import '../libraries/page_templates.dart';
import 'database_classes.dart';
import 'notifications.dart';

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
      String img = exercises[exerciseIndex]![whichExercise]['image'] as String;
      if (exercises[exerciseIndex]![whichExercise]["questionType"] ==
          "fillInTheBlank") {
        practiceLessons.add(templateFillInBlankQuestion(
            context, exercises[exerciseIndex]![whichExercise],
            reviewOrExtra: "r",
            lessonName: currentReview.lessonName,
            image: img));
      } else if (exercises[exerciseIndex]![whichExercise]["questionType"] ==
          "chat") {
        practiceLessons.add(templateChatQuestion(
            context, exercises[exerciseIndex]![whichExercise],
            reviewOrExtra: "r",
            lessonName: currentReview.lessonName,
            image: img));
      } else {
        practiceLessons.add(Container(
            child: const Text("Error: question type unaccounted for")));
      }
    }
    //TODO: I think this will work but should go back and check to make sure
    practiceLessons.add(templateReviewsComplete(context, 'Testing this'));

    return practiceLessons;
  }

  void clear() {
    myPracticeReviews = [];
  }

  void refresh() {
    notifyListeners();
  }
}

class NotificationProvider extends ChangeNotifier {
  DateTime nextNotification = DateTime(1970, 1, 1);
  bool sendNotif = false;

  //For the lesson notifications
  Future<bool> setNotificationLesson(DateTime cachedNotification) async {
    // if there is no notification schedule or the notification has already happened and a new one is not scheduled, schedule another
    dev.log("IN THE REVIEW SETTER");
    DateTime nextNotification =
        await NotificationStorage().readNotificationFile();
    dev.log("DATA TO STRING");
    dev.log(nextNotification.toString());
    dev.log("HERE IS NEXT NOTIFICATION");
    dev.log(nextNotification.toString());
    if (nextNotification!.isBefore(DateTime.now())) {
      nextNotification = cachedNotification;

      NotificationStorage().writeNotification(nextNotification);
      sendNotif = true;
      return true;
      // else if it is before the next notification, do nothing
    } else if (DateTime.now().isBefore(nextNotification!)) {
      return false;
      //Do nothing, probably don't even need this here
      // It is a little bit over 24 hours because that way you won't have any notifications scheduled during multiple lessons
      // TODO: maybe adjust how many hours for a little bit more if that seems necessary
    } else {
      return false;
    }
  }

  Future<bool> setNotificationReview(DateTime cachedNotification) async {
    // if there is no notification schedule or the notification has already happened and a new one is not scheduled, schedule another

    nextNotification = await NotificationStorage().readNotificationFile();

    if (nextNotification!.isBefore(DateTime.now())) {
      nextNotification = cachedNotification;
      NotificationStorage().writeNotification(nextNotification);
      sendNotif = true;
      return true;
      //make sure next notification is at least 12 hours later to prevent spam
    } else if (nextNotification!
        .isAfter(DateTime.now().add(const Duration(hours: 12)))) {
      if (nextNotification!.isAfter(cachedNotification)) {
        nextNotification = cachedNotification;
        NotificationStorage().writeNotification(nextNotification);
        sendNotif = true;
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void scheduleNotification(bool sendNotif) {
    //schedule the notification and make nextNotification null?
    dev.log("IN THE SCHEDULE NOTIFICATION");
    //calculate the difference between DateTime.now() and the nextNotification in second
    dev.log(sendNotif.toString());
    if (sendNotif == true) {
      dev.log("SEND NOTIF IS TRUE");
      int intervalInSeconds = 1000 *
          (nextNotification!.millisecondsSinceEpoch -
              DateTime.now().millisecondsSinceEpoch);

      //schedule the notification
      //TODO: SWITCH THIS BACK WHEN DONE TESTING
      NotificationService.showNotification(
          title: "Time to Practice!",
          body: "Click here to learn Japanese",
          scheduled: true,
          interval: intervalInSeconds);

      sendNotif = false;
    }
  }

  void restartNotificationFileContext() {
    NotificationStorage().writeNotification(DateTime(1970, 1, 1));
  }

  void exit() {
    sendNotif = false;
  }

  void clear() {
    nextNotification = DateTime(1970, 1, 1);
    sendNotif = false;
  }

  void refresh() {
    notifyListeners();
  }
}
