import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/classes/questions/chat_exercise.dart';
import '../../project/libraries/page_templates.dart';

class LessonIru extends StatefulWidget {
  const LessonIru({super.key});

  @override
  State<LessonIru> createState() => _LessonIruState();
}

class _LessonIruState extends State<LessonIru> {
  final List<Map<String, Object>> _questions = [
    {
      'question': const [
        ChatBubble(
          text: 'もしもし、田中だけど。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'もしもし、どうしたの？',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '旅行に行ったからお土産を渡したいんだけど、今家にいる？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'いるよ。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "じゃあ今から行くね。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': [' ', 'よ。                                    '],
      'questionType': 'chat',
      'answers': ['いる', 'います', 'iru', 'imasu'],
      'image': 'assets/irasutoya/denwa_kaiwa.png'
    },
    {
      'question': const [
        ChatBubble(
          text: 'ミーティングをしたいのですが、いつがよろしいでしょうか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '明日でしたら空いています。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '承知いたしました。何時ごろでしたら...',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'オフィスにいらっしゃいますか？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "午後2時でお願いいたします。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['オフィスに', 'ますか？'],
      'questionType': 'chat',
      'answers': ['いらっしゃい', 'irashai', 'irasshai'],
      'image': 'assets/irasutoya/bowing_women.png'
    },
    {
      'question': const [
        ChatBubble(
          text: '高橋部長はいらっしゃいますでしょうか。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '申し訳ございません、今は席を外しております。何時ごろでしたらいらっしゃいますか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '4時にはオフィスにおります。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "わかりました、では４時ごろにまたお電話いたします。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['4時にはオフィスに', 'ます。'],
      'questionType': 'chat',
      'answers': ['おり', 'ori', 'ori'],
      'image': 'assets/irasutoya/kaisha_denwa.png'
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
                context, "assets/irasutoya/kokusai_woman.png", "To Exist: いる"),
            templatePageInfo(context, "assets/irasutoya/alien.png",
                "The word for 'to exist' in Japanese is ある／あります for inanimate objects and いる／います for animate objects. It is used for a lot more situations than it would be in English. For example, it is often used to ask where something is."),
            templateChatQuestion(context, _questions[0],
                image: "assets/irasutoya/denwa_kaiwa.png"),
            templatePageInfo(context, "assets/irasutoya/super_businessman.png",
                "Next, the 尊敬語 (sonkeigo) word for 'to exist' is いらっしゃる (irassharu)."),
            templateChatQuestion(context, _questions[1],
                image: "assets/irasutoya/bowing_women.png"),
            templatePageInfo(context, "assets/irasutoya/kenjougo.jpg",
                "The 謙譲語 (kenjougo) way to say 'to exist' is おります."),
            templateChatQuestion(context, _questions[2],
                image: "assets/irasutoya/kaisha_denwa.png"),
            templateLessonComplete(context, "Nice job!", "To Exist: いる")
          ],
        ),
      ),
    );
  }
}
