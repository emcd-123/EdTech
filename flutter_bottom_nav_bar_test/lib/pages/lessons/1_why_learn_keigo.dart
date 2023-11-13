import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import '../../project/classes/providers.dart';
import '../../project/libraries/page_templates.dart';

class LessonWhyLearnKeigo extends StatefulWidget {
  const LessonWhyLearnKeigo({super.key});

  @override
  State<LessonWhyLearnKeigo> createState() => _LessonWhyLearnKeigoState();
}

class _LessonWhyLearnKeigoState extends State<LessonWhyLearnKeigo> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'The respectful form of Keigo is called ___.',
      'questionType': "fillInTheBlank",
      'answers': ['そんけいご', '尊敬語', 'sonkeigo', 'Sonkeigo'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<ScoreKeeperProvider>(context, listen: false)
        .initializeReqScore(_questions.length);

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
            scrollDirection: Axis.horizontal,
            children: [
              templateTitlePage(context, "assets/irasutoya/study_nihongo.png",
                  "Why Learn Keigo?"),
              templateFillInBlankQuestion(context, _questions[0]),
              templateLessonComplete(context, "Great Job!", "why_learn_keigo"),
            ],
          ),
        ),
      ),
    );
  }
}
