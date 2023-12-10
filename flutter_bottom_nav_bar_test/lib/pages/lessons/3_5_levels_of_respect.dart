import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/libraries/page_templates.dart';

class LessonLevelsOfRespect extends StatefulWidget {
  const LessonLevelsOfRespect({super.key});

  @override
  State<LessonLevelsOfRespect> createState() => _LessonLevelsOfRespectState();
}

class _LessonLevelsOfRespectState extends State<LessonLevelsOfRespect> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'The respectful form of keigo is called___.',
      'questionType': "fillInTheBlank",
      'answers': ['尊敬語', 'そんけいご', 'sonkeigo', 'Sonkeigo'],
    },
    {
      'question':
          'You are talking to your boss, use 尊敬語 (sonkeigo): お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ["召し上がり", "めしあがり", "meshiagari"],
      'image': 'boss'
    },
    {
      'question':
          'You are talking about yourself, use 謙譲語 (kenjougo): お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ["頂き", "いただき", "itadaki"],
      'image': 'me'
    },
    {
      'question':
          'You are talking to a stranger, use 丁寧語 (teineigo): お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ["食べ", "たべ", "tabe"],
      'image': 'stranger'
    },
    {
      'question': 'You are talking to a friend, use タメ語 (tamego): すしを___る?',
      'questionType': "fillInTheBlank",
      'answers': ["食べ", "たべ", "tabe"],
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
                context,
                "assets/irasutoya/school_sensei_kokuban_woman.png",
                "Levels of Respect:\n丁寧語, 尊敬語, and 謙譲語"),
            templatePageInfo(context, "assets/irasutoya/choice.jpg",
                """Keigo can be broken down into three different types: 丁寧語 (teineigo), 尊敬語 (sonkeigo), and 謙譲語 (kenjougo).
Each one of these has a different context that it is used in, and each one conveys politeness in a different way.
            """),
            templatePageInfo(
                context,
                "assets/irasutoya/hirameki_man.png",
                """
The first form of keigo is 丁寧語 (teineigo). Luckily, if you have some experience learning Japanese already, this form should already be familiar to you. Directly translating to "polite language", 丁寧語 is the verb form that ends with ～ます, and it is often taught alongside the casual/plain form in Japanese language classes. This form is more of a default for polite language, while the other two forms, 尊敬語 (sonkeigo) and 謙譲語 (kenjougo), are used to be extra polite. You will often default to this form of keigo outside of very formal settings. 
""",
                longText: true),
            templatePageInfo(
                context,
                "assets/irasutoya/restaurant_menu_erabu.png",
                "Examples of when you would use 丁寧語 (teineigo) include when you are talking to older people, people with higher social rank, and people you do not know too well. 食べる (taberu) is the casual form of 'to eat' while 食べます (tabemasu) is the 丁寧語 (teineigo) form of 'to eat'."),
            templatePageInfo(
                context,
                "assets/irasutoya/ojigi_aisatsu_businessman.png",
                "The next form of keigo is known as 尊敬語 (sonkeigo), which translates to 'respectful language'. This keigo form is used to show extra respect to the person you are talking to. This might be used when talking to the boss at your company or when a waiter is talking to a customer at a restaurant. Unlike the difference between casual form and 丁寧語 (teineigo), some verbs will be completely different rather than just changing the ending. For example, the word for 'to eat' in 尊敬語 (sonkeigo) is 召し上がります (meshiagarimasu)."),
            templatePageInfo(context, "assets/irasutoya/kinshi_oshaberi.png",
                "One important thing to note is that you will only use this form when addressing someone of higher social status and what they are doing. You should never use 尊敬語 (sonkeigo) to talk about yourself."),
            templatePageInfo(context, "assets/irasutoya/kenjougo_man.png",
                "The third form of keigo is called 謙譲語 (kenjougo), which translates to 'humble language'. This is the form of keigo that you will use to address yourself or anyone else that is in your in-group. This form makes its user sound more modest and humble and it will often be used alongside 尊敬語 (sonkeigo) to sound extra polite. Similarly to 尊敬語 (sonkeigo), 謙譲語 (kenjougo) verb forms can be very different from casual and 丁寧語 (teineigo) forms. The word for 'to eat' in 謙譲語 (kenjougo) is いただきます (itadakimasu).",
                longText: true),
            templateFillInBlankQuestion(context, _questions[0]),
            templateFillInBlankQuestion(context, _questions[1], image: "boss"),
            templateFillInBlankQuestion(context, _questions[2], image: "me"),
            templateFillInBlankQuestion(context, _questions[3],
                image: "stranger"),
            templateFillInBlankQuestion(context, _questions[4],
                image: 'friend'),
            templateLessonComplete(
                context,
                "Nice job! You now know the different types of keigo.",
                "levels_of_respect"),
          ],
        ),
      ),
    );
  }
}
