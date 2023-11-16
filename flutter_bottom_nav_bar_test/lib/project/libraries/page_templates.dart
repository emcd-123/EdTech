import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/database_classes.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/mc_question.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../classes/fill_blank_question.dart';

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

Container templatePageInfo(context, image, text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(image: AssetImage(image)),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(text),
        )
      ],
    ),
  );
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
                      //TODO: going to need something that prevents adding the review into the database twice
                      log(scoreKeeperProvider.requiredScore.toString());
                      log(scoreKeeperProvider.totalScore.toString());
                      DatabaseHelper.instance.addReview(Review(
                          lessonName: lessonName.toString(),
                          nextReview:
                              DateTime.now().add(const Duration(days: 1)),
                          reviewStrength: 1));
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
          Text(scoreKeeperProvider.totalScore.toString())
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
Container templateFillInBlankQuestion(context, questionNum) {
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
          )
        ],
      ),
    ),
  );
}
