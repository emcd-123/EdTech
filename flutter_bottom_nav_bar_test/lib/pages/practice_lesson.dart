import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/mc_answer.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/mc_question.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:go_router/go_router.dart';
import '../project/classes/database_classes.dart';
import '../project/exercises/exercises.dart';

import '../../project/libraries/page_templates.dart';

class LessonPractice extends StatefulWidget {
  const LessonPractice({super.key});

  @override
  State<LessonPractice> createState() => _LessonPracticeState();
}

class _LessonPracticeState extends State<LessonPractice> {
  //TODO: Get this to dynamically change size based on how many practices are scheduled
  @override
  Widget build(BuildContext context) {
    Future<List<Review>> _reviewSchedule =
        DatabaseHelper.instance.getReviewsDue();

    Provider.of<ScoreKeeperProvider>(context, listen: false)
        .initializeReqScore(100);

    return Consumer<MyPracticeReviewsProvider>(builder: (BuildContext context,
        MyPracticeReviewsProvider myPracticeReviewsProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop(context);
              myPracticeReviewsProvider.clear();
            },
            icon: const Icon(Icons.clear_rounded),
          ),
        ),
        body: Center(
          child: FutureBuilder(
            future: _reviewSchedule,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                List<Review> reviewData = snapshot.data;

                if (reviewData == []) {
                  //Generate practice exercises that do not affect the SRS
                  return const Text("No reviews due at the moment");
                } else {
                  // grab a review to do the lesson and pop it out when its done, do something else when the list is empty
                  //TODO: Figure out how to fix this so it returns the right reviews and so it does not constantly say "well done after a correct answer"
                  // I think that this is running to problem because it is rebuilding the list each time and the list is not actually getting any smaller
                  // maybe declare an empty list outside and then have an if statement so that if it is empty then fill it, else display the lessons
                  // could even have a boolean that says nice job or something once you have complete all the lessons

                  myPracticeReviewsProvider.setReviews(reviewData);

                  dev.log("made it here");
                  return PageView(
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    children: myPracticeReviewsProvider.getLessons(context),
                  );
                }
              } else {
                return const Text("Error");
              }
            },
          ),
        ),
      );
    });
  }
}
