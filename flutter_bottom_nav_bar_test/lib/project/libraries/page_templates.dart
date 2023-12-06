import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/database_classes.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/questions/mc_question.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../classes/questions/fill_blank_question.dart';
import '../classes/notifications.dart';

Container templateTitlePage(context, image, text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Image(image: AssetImage(image))
        ],
      ),
    ),
  );
}

Container templatePageInfo(context, image, text,
    {String tooltip = "", bool longText = false
    //int textSize
    }) {
  List<Widget> children = [];

  if (tooltip != "") {
    children = [
      Image(image: AssetImage(image)),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                JustTheTooltip(
                  preferredDirection: AxisDirection.up,
                  elevation: 8,
                  isModal: true,
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tooltip,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  child: const Material(
                    color: Colors.yellowAccent,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      )
    ];
  } else {
    children = [
      Image(image: AssetImage(image)),
      Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      )
    ];
  }

  if (longText == false) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  } else {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: ListView(
        children: children,
      ),
    );
  }
}

Container templateLessonComplete(context, text, lessonName) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: scoreKeeperProvider.totalScore ==
                    scoreKeeperProvider.requiredScore
                ? Text(text)
                : const Text(
                    "Finish all the exercises before completing the lesson"),
          ),
          ElevatedButton(
              onPressed: scoreKeeperProvider.totalScore ==
                      scoreKeeperProvider.requiredScore
                  ? () {
                      // This section adds a new review entry into the sql database
                      DatabaseHelper.instance
                          .addReview(Review(
                              lessonName: lessonName.toString(),
                              nextReview:
                                  DateTime.now().add(const Duration(days: 1)),
                              reviewStrength: 1))
                          .then((value) {
                        // this one will display a notification in 24 hours once the lesson in complete
                        // TODO: add a provider that will keep track of notifications so that they only get sent once every 24 hours in order to not be annoying
                        // This will also use the notification provider as well
                        log(value.toString());
                        if (value != -1) {}
                      });

                      scoreKeeperProvider.clearTotalScore();
                      GoRouter.of(context).pop(context);
                    }
                  : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      scoreKeeperProvider.totalScore ==
                              scoreKeeperProvider.requiredScore
                          ? Colors.red
                          : Colors.grey)),
              child: const Text("Complete Lesson"))
        ],
      ),
    ),
  );
}

Container templateReviewsComplete(context, text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: scoreKeeperProvider.totalScore ==
                    scoreKeeperProvider.requiredScore
                ? Text(text)
                : const Text(
                    "Finish all the exercises before completing the review session"),
          ),
          ElevatedButton(
              onPressed: scoreKeeperProvider.totalScore ==
                      scoreKeeperProvider.requiredScore
                  ? () {
                      // This section adds a new review entry into the sql database
                      DatabaseHelper.instance
                          .getEarliestReviewDateTime()
                          .then((value) {
                        // this one will display a notification in 24 hours once the lesson in complete
                        // TODO: add a provider that will keep track of notifications so that they only get sent once every 24 hours in order to not be annoying
                        // This will also use the notification provider as well
                        NotificationProvider()
                            .setNotificationReview(value)
                            .then(
                          (sendNotif) {
                            NotificationProvider()
                                .scheduleNotification(sendNotif);
                          },
                        );
                      });

                      scoreKeeperProvider.clearTotalScore();
                      GoRouter.of(context).pop(context);
                    }
                  : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      scoreKeeperProvider.totalScore ==
                              scoreKeeperProvider.requiredScore
                          ? Colors.red
                          : Colors.grey)),
              child: const Text("Complete Review Session"))
        ],
      ),
    ),
  );
}

Container templateWorkInProgress(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: const Text("This lesson is still being developed."),
        ),
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop(context);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: const Text("Return to Lessons Page"))
      ],
    ),
  );
}

Container templateMultipleChoiceQuestion(context, questionNum) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Column(
        //TODO GET RID OF THIS COLUMN AFTER DEBUGGING I DO NOT LIKE IT
        children: [
          MCQuestion(
            question: questionNum,
          ),
        ],
      ),
    ),
  );
}

//TODO
Container templateOpenResponseQuestion(context, questionNum) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Column(
        //TODO GET RID OF THIS COLUMN AFTER DEBUGGING I DO NOT LIKE IT
        children: [Text(scoreKeeperProvider.totalScore.toString())],
      ),
    ),
  );
}

//TODO
Container templateFillInBlankQuestion(
  context,
  questionNum, {
  String reviewOrExtra = "",
  String lessonName = "",
  String image = "",
}) {
  log("IN TEMPLATE");
  log(image);
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Column(
        //TODO GET RID OF THIS COLUMN AFTER DEBUGGING I DO NOT LIKE IT
        children: [
          FillInBlankQuestion(
              question: questionNum,
              reviewOrExtra: reviewOrExtra,
              lessonName: lessonName,
              image: image)
        ],
      ),
    ),
  );
}
