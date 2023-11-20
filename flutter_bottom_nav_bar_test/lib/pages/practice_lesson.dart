import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/mc_answer.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/mc_question.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:go_router/go_router.dart';
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
    Provider.of<ScoreKeeperProvider>(context, listen: false)
        .initializeReqScore(5);

    return Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop(context);
              scoreKeeperProvider.clearTotalScore();
            },
            icon: const Icon(Icons.clear_rounded),
          ),
        ),
        body: Center(
          child: PageView(
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            children: [
              templateFillInBlankQuestion(context, exercises['meishi']![0]),
              templateFillInBlankQuestion(context, exercises['meishi']![3]),
              templateFillInBlankQuestion(
                  context, exercises['taberu_nomu']![0]),
              templateFillInBlankQuestion(
                  context, exercises['taberu_nomu']![1]),
              templateFillInBlankQuestion(
                  context, exercises['taberu_nomu']![7]),
              templateLessonComplete(
                  context,
                  "Well Done! You have completed the first step towards mastering keigo!",
                  "what_is_keigo")
            ],
          ),
        ),
      ),
    );
  }
}
