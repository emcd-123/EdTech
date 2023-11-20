import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/libraries/page_templates.dart';

class LessonCopula extends StatefulWidget {
  const LessonCopula({super.key});

  @override
  State<LessonCopula> createState() => _LessonCopulaState();
}

class _LessonCopulaState extends State<LessonCopula> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Why should you learn keigo (choose multiple)?',
      'questionType': "multipleChoice",
      'answers': [
        {
          'answerText': 'To gain a deeper understanding of Japanese culture',
          'score': true
        },
        {'answerText': 'To improve listening comprehension', 'score': true},
        {'answerText': 'For the challenge', 'score': true},
      ],
    },
    {
      'question': 'The respectful form of keigo is called___.',
      'questionType': "fillInTheBlank",
      'answers': ['そんけいご', '尊敬語', 'sonkeigo', 'Sonkeigo'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<ScoreKeeperProvider>(context, listen: false)
        .initializeReqScore(_questions.length);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
          icon: const Icon(Icons.clear_rounded),
        ),
      ),
      body: Center(
        child: PageView(
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          children: [
            templateTitlePage(
                context, "assets/irasutoya/study_nihongo.png", "Copula: だ・です"),
            templateWorkInProgress(context),
          ],
        ),
      ),
    );
  }
}
