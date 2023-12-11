import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/classes/questions/chat_exercise.dart';
import '../../project/libraries/page_templates.dart';

class LessonTaberuNomu extends StatefulWidget {
  const LessonTaberuNomu({super.key});

  @override
  State<LessonTaberuNomu> createState() => _LessonTaberuNomuState();
}

class _LessonTaberuNomuState extends State<LessonTaberuNomu> {
  final List<Map<String, Object>> _questions = [
    {
      'question': const [
        ChatBubble(
          text: '今日は誘ってくれてありがとう',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'いえいえ、今日は君の誕生日だから、僕がおごる（お金を払う）よ。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'ありがとう！ じゃあ...',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'このステーキを食べてもいい？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "もちろん。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['このステーキを', 'てもいい？'],
      'questionType': 'chat',
      'answers': ['食べ', 'たべ', 'tabe'],
      'image': 'assets/irasutoya/restaurant.png'
    },
    {
      'question': const [
        ChatBubble(
          text: '部長、旅行に行ったので、よかったらお土産いかがですか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'ありがとう。これは何？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '沖縄の海ブドウです。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '部長は召し上がったことはありますか？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "初めて食べるよ、ありがとう。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['部長は', 'ことはありますか？'],
      'questionType': 'chat',
      'answers': ['召し上がった', 'めしあがった', 'meshiagatta'],
      'image': 'boss'
    },
    {
      'question': const [
        ChatBubble(
          text: '今日はお食事にお誘いいただきありがとうございます。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'こちらこそ来てくれてありがとう。お金は私が払うから、好きなものを食べて。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'ありがとうございます。では...',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'このステーキをいただいてもいいですか。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "もちろん！", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['このステーキを', 'てもいいですか。'],
      'questionType': 'chat',
      'answers': ['いただい', '頂い', 'itadai'],
      'image': 'boss_eat'
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
                context, "assets/irasutoya/oishii_boy.png", "食べる・飲む"),
            templatePageInfo(context, "assets/irasutoya/drink_man.png",
                "You will be very happy to hear that with this keigo lesson, you will get two verbs for the price of one! The words for 'to eat' 食べる (taberu) and 'to drink' 飲む (nomu) function identically in their 尊敬語 (sonkeigo) and 謙譲語 (kenjougo) forms."),
            templatePageInfo(context, "assets/irasutoya/ramen.png",
                "Like always, the verbs for to eat and to drink are 食べる／食べます (taberu/tabemasu) and 飲む／飲みます (nomu/nomimasu), respectively."),
            templateChatQuestion(context, _questions[0],
                image: "assets/irasutoya/restaurant.png"),
            templatePageInfo(context, "assets/irasutoya/takoyaki.png",
                "Next, the 尊敬語 (sonkeigo) word for 'to eat' and 'to drink' is 召し上がる (meshiagaru)."),
            templateChatQuestion(context, _questions[1], image: "boss"),
            templatePageInfo(context, "assets/irasutoya/itadakimasu.png",
                "Finally, the 謙譲語 (kenjougo) word for 'to eat' and 'to drink' is いただきます.",
                tooltip:
                    "You may have noticed that this word is the same 'itadakimasu' that is commonly used by Japanese people before eating. This is a way to show respect for the life of the animals and plants that were used to make the food as well as the people involved in cooking the meal."),
            templateChatQuestion(context, _questions[2], image: "boss_eat"),
            templateLessonComplete(context, "よくできた！", "食べる・飲む"),
          ],
        ),
      ),
    );
  }
}
