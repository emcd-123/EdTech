import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/classes/questions/chat_exercise.dart';
import '../../project/libraries/page_templates.dart';

class LessonSuru extends StatefulWidget {
  const LessonSuru({super.key});

  @override
  State<LessonSuru> createState() => _LessonSuruState();
}

class _LessonSuruState extends State<LessonSuru> {
  final List<Map<String, Object>> _questions = [
    {
      'question': const [
        ChatBubble(
          text: '二人は初めて会うよね。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'そうだね。初めまして、田中君の同僚です。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'こっちは、佐藤。大学のころの友達。',
          isCurrentUser: false,
        ),
        ChatBubble(text: "へぇ。何の仕事をしているの？", isCurrentUser: true),
        ChatBubble(
          text: '教師だよ。',
          isCurrentUser: false,
        ),
      ],
      'answerBubble': 3,
      'affixes': ['へぇ。何の仕事を', 'るの？'],
      'questionType': 'chat',
      'answers': ['してい', 'す', 'shitei', 'su'],
      'image': 'assets/irasutoya/friend_shoukai.png'
    },
    {
      'question': const [
        ChatBubble(
          text: 'プロジェクトの成功を祝して、食事会を開きたいのですがいかがでしょうか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'わかりました。社内のものに伝えておきます。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '店の予約は私がいたしますので、よろしくお願いします。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "こちらこそよろしくお願いいたします。", isCurrentUser: false),
      ],
      'answerBubble': 3,
      'affixes': ['店の予約は私が', 'ますので...'],
      'questionType': 'chat',
      'answers': ['いたし', 'itasi', 'itashi'],
      'image': 'assets/irasutoya/kaisha_phone.png'
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
            templateTitlePage(context,
                "assets/irasutoya/wheelchair_basketball.png", "To Do: する"),
            templatePageInfo(context, "assets/irasutoya/sing.png",
                "The word for 'to do' is the most versatile keigo word that you will learn. Any verb that uses する (suru) in it, such as 運動する (undou suru), will use the same keigo patterns! This gives you access to hundreds of keigo verbs by just learning one verb."),
            templateChatQuestion(context, _questions[0],
                image: 'assets/irasutoya/friend_shoukai.png'),
            templatePageInfo(context, "assets/irasutoya/boss_woman.png",
                "The 尊敬語 (sonkeigo) word for 'to do' has two forms: なさる (nasaru) and される (sareru)"),
            templatePageInfo(context, "assets/irasutoya/kenjougo.jpg",
                "Finally, the 謙譲語 (kenjougo) word for 'to do' is いたす (itasu)."),
            templateChatQuestion(context, _questions[1],
                image: "assets/irasutoya/kaisha_phone.png"),
            templateLessonComplete(context, "やった！", "To Do: する"),
          ],
        ),
      ),
    );
  }
}
