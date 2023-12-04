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
      'question': 'Why should you learn keigo? (choose multiple)',
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
        .initializeReqScore(3);

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
              templateTitlePage(
                  context,
                  "assets/irasutoya/internet_school_e-learning_man.png",
                  "Why Learn Keigo?"),
              templatePageInfo(
                  context,
                  "assets/irasutoya/study_wakaranai_girl.png",
                  "Japanese is a very difficult language to learn for many non-native speakers. One of the things that makes it difficult is keigo. Because of the extra formality, many people, including Japanese native speakers, have questioned whether it is worth it to learn keigo."),
              templatePageInfo(context, "assets/irasutoya/school_bunkasai.png",
                  "Despite this difficulty, there are two major reasons that Japanese learners will benefit from learning keigo: cultural understanding and listening comprehension."),
              templatePageInfo(
                  context,
                  "assets/irasutoya/shichigosan_torii.png",
                  "Keigo is a deeply routed part of Japanese culture. Since it is so connected to the values of Japanese society, understanding keigo will give you a deeper understanding of the cultural values and norms of the Japanese people. Consequently, this will help you adapt to the culture and immerse yourself in the language faster."),
              templatePageInfo(context, "assets/irasutoya/music_kids.png",
                  "The second reason that non-native speakers will benefit from learning keigo is listening comprehension. Improving your understanding of keigo will help you understand what Japanese speakers are saying when they use it."),
              templateMultipleChoiceQuestion(context, _questions[0]),
              templateLessonComplete(context, "Great Job!", "why_learn_keigo"),
            ],
          ),
        ),
      ),
    );
  }
}
