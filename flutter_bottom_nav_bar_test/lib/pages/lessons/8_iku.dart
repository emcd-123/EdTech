import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/classes/questions/chat_exercise.dart';
import '../../project/libraries/page_templates.dart';

class LessonIku extends StatefulWidget {
  const LessonIku({super.key});

  @override
  State<LessonIku> createState() => _LessonIkuState();
}

class _LessonIkuState extends State<LessonIku> {
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
      'question': const [
        ChatBubble(
          text: '雪が好きなので、来月北海道に参ります',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '本当ですか。先週北海道に行きました',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'どうして北海道にいらっしゃいましたか。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "家族が北海道に住んでいるからです", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['どうして北海道に', 'ましたか'],
      'questionType': 'chat',
      'answers': ['いらっしゃい', 'irashai', 'irasshai'],
      'image': 'boss'
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
                context, "assets/irasutoya/study_nihongo.png", "行く"),
            templateChatQuestion(context, _questions[1], image: "boss"),
            templateWorkInProgress(context)
          ],
        ),
      ),
    );
  }
}
