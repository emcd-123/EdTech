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
      'question': const [
        ChatBubble(
          text: '部長に聞いたんだけど、駅前にできたカレー屋さんがすごくおいしいらしいよ。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'そうなんだ。行ってみたいな。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'じゃあ、今日のランチ、その店に一緒に行く？',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'うん、行くぞ。',
          isCurrentUser: false,
        ),
      ],
      'answerBubble': 2,
      'affixes': ['今日のランチ、その店に一緒に', '?'],
      'questionType': 'chat',
      'answers': ['行く', 'いく', 'iku'],
      'image': 'assets/irasutoya/friend.jpg'
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
      'question': const [
        ChatBubble(
          text: '何時にオフィスにいらっしゃいますか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '3時でしたら大丈夫です。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'では、3時に伺います。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "はい、よろしくお願いいたします。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['では、3時に', 'ます。'],
      'questionType': 'chat',
      'answers': ['伺い', 'うかがい', 'ukagai'],
      'image': 'assets/irasutoya/bowing_women.png'
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
            templateTitlePage(context, "assets/irasutoya/iku0.png", "行く"),
            templatePageInfo(context, "assets/irasutoya/iku1.png",
                "This is another convenient keigo word because the words for 'to go' and 'to come' use the same keigo, similar to how it works for 'to eat' and 'to drink'."),
            templateChatQuestion(context, _questions[0],
                image: 'assets/irasutoya/friend.jpg'),
            templateYoutubeVideo(
              context,
              'ofpae7H6NS0',
              "The word for 'to come' and 'to go' in Japanese is いらっしゃる (irassharu). You may have heard いらっしゃいませ (irasshaimase) when someone enters a store in Japan. This is a respectful way to say 'come in' to the customers",
            ),
            templateChatQuestion(context, _questions[1], image: "boss"),
            templatePageInfo(context, "assets/irasutoya/iku2.png",
                "Lastly, the 謙譲語 (kenjougo) word for 'to go/come' has two forms. You can either hear it as 伺う (ukagau) or as 参る (mairu)."),
            templateChatQuestion(context, _questions[2],
                image: 'assets/irasutoya/bowing_women.png'),
            templateLessonComplete(context, "Nice job!", "行く・来る")
          ],
        ),
      ),
    );
  }
}
