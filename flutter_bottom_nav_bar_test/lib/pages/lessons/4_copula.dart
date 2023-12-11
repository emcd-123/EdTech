import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/classes/questions/chat_exercise.dart';
import '../../project/libraries/page_templates.dart';

class LessonCopula extends StatefulWidget {
  const LessonCopula({super.key});

  @override
  State<LessonCopula> createState() => _LessonCopulaState();
}

class _LessonCopulaState extends State<LessonCopula> {
  final List<Map<String, Object>> _questions = [
    {
      'question': const [
        ChatBubble(
          text: '田中、久しぶり！',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '久しぶり。元気だった？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'うん。元気だよ。そっちは？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "元気にしてたよ。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['うん。元気', 'よ。そっちは？'],
      'questionType': 'chat',
      'answers': ['だ', 'だ', 'da'],
      'image': 'friend'
    },
    {
      'question': const [
        ChatBubble(
          text: '久しぶり、元気にしていた？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'はい、おかげさまで元気です。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '部長は、お元気でいらっしゃいますか？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "元気にしてたよ。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['部長は、お元気', 'ますか？'],
      'questionType': 'chat',
      'answers': ['でいらっしゃい', 'deirashai', 'deirasshai'],
      'image': 'boss'
    },
    {
      'question':
          'In a situation where you have to use 尊敬語 (sonkeigo), will the other person always use 尊敬語 (sonkeigo) back to you?',
      'questionType': "multipleChoice",
      'answers': [
        {'answerText': 'Yes', 'score': false},
        {'answerText': 'No', 'score': true},
      ],
    },
    {
      'question': const [
        ChatBubble(
          text: '初めまして、田中と申します。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '初めまして、よろしくお願いいたします。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'そちらの方はどなたですか。',
          isCurrentUser: false,
        ),
        ChatBubble(text: "こちらは弊社の部長の高橋でございます。", isCurrentUser: true),
        ChatBubble(
          text: 'よろしくお願いいたします。',
          isCurrentUser: false,
        ),
      ],
      'answerBubble': 3,
      'affixes': ['こちらは弊社の部長の高橋', 'ます。'],
      'questionType': 'chat',
      'answers': ['でござい', 'degozai', 'degozai'],
      'image': 'boss'
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
                context, "assets/irasutoya/study_nihongo.png", "To Be: だ・です"),
            templatePageInfo(context, "assets/irasutoya/skull.png",
                "To be or not to be: that is the question. Being one of the most commmonly used words in any language, you'll have to use the word 'to be' a lot in daily conversations. Assuming you have prior experience with Japanese, you should be familiar with the 丁寧語 (teineigo) word for this, です (desu)."),
            templatePageInfo(context, "assets/irasutoya/basketball.png",
                "In Japanese, the word for 'to be' in タメ語 (tamego) is だ (da). Try it out in the next screen.",
                tooltip:
                    "It is also fairly common for the word for です (desu)／だ (da) to be dropped from the sentence. For example, これはペンだ (kore wa pen da) would be commonly shortened to just これはペン (kore wa pen)."),
            templateChatQuestion(context, _questions[0], image: "friend"),
            templatePageInfo(context, "assets/irasutoya/tablet_businessman.png",
                "In 尊敬語 (sonkeigo), the word that you would use would be でいらっしゃる."),
            templateChatQuestion(context, _questions[1], image: "boss"),
            templateMultipleChoiceQuestion(context, _questions[2]),
            templatePageInfo(context, "assets/irasutoya/caste_mama.png",
                "Remember: Keigo is used to show respect within the Japanese hierarchical system. Thus, 尊敬語 and 謙譲語 will not be used to someone that is lower in the hierarchy."),
            templatePageInfo(context, "assets/irasutoya/weird_deer.png",
                "Finally, the 謙譲語 (kenjougo) form of 'to be' is でございます."),
            templateChatQuestion(context, _questions[3],
                image: "assets/irasutoya/shoukai.png"),
            templateLessonComplete(context, "Well done!", "To Be: だ"),
          ],
        ),
      ),
    );
  }
}
