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
      'answers': ['そんけいご', '尊敬語', 'sonkeigo', 'Sonkeigo'],
    },
    {
      'question': 'Complete the sentence in 尊敬語 (sonkeigo) form: お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ["めしあがり", "召し上がり", "meshiagari"],
    },
    {
      'question': 'Complete the sentence in 謙譲語 (kenjougo) form: お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ["itadaki", "いただき", "頂き"],
    },
    {
      'question': 'Complete the sentence in 丁寧語 (teineigo) form: お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ["tabe", "たべ", "食べ"],
    },
    {
      'question':
          'Complete the sentence in タメ語 (casual/plain/tamego) form: すしを___る?',
      'questionType': "fillInTheBlank",
      'answers': ["tabe", "たべ", "食べ"],
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
            templateTitlePage(context, "assets/irasutoya/study_nihongo.png",
                "Levels of Respect: 丁寧語, 尊敬語, and 謙譲語"),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                """Keigo can be broken down into three different types: 丁寧語 (teineigo), 尊敬語 (sonkeigo), and 謙譲語 (kenjougo).
Each one of these has a different context that it is used in, and each one conveys politeness in a different way.
            """),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png", """
The first form of keigo is 丁寧語 (teineigo). Luckily, if you have some experience learning Japanese already, this form should already be familiar to you. Directly translating to "polite language", 丁寧語 is the verb form that ends with ～ます, and it is often taught alongside the casual/plain form in Japanese language classes. This form is more of a default for polite language, while the other two forms, 尊敬語 and 謙譲語, are used to be extra polite. You will often default to this form of keigo outside of very formal settings. 
"""),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                "Examples of when you would use 丁寧語 include when you are talking to older people, people with higher social rank, and people you do not know too well. 食べる (taberu) is the plain/casual form of 'to eat' while 食べます (tabemasu) is the 丁寧語 form of 'to eat'."),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                "The next form of keigo is known as 尊敬語 (sonkeigo), which translates to 'respectful language'. This keigo form is used to show extra respect to the person you are talking to. This might be used in when talking to the boss at your company or when a waiter is talking to a customer at a restaurant. Unlike the difference between plain/casual form and 丁寧語, some verbs will be completely different rather than just changing the ending. For example, the word for 'to eat' in 尊敬語 is 召し上がります (meshiagarimasu)."),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                "One important thing to note is that you will only use this form when addressing someone of higher social status and what they are doing. You should never use 尊敬語 to talk about yourself."),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                "The third form of keigo is called 謙譲語 (kenjougo), which translates to 'humble language'. This is the form of keigo that you will use to address yourself or anyone else that is in your in-group. This form makes its user sound more modest and humble and it will often be used alongside 尊敬語 (sonkeigo) to sound extra polite. Similarly to 尊敬語, 謙譲語 verb forms can be very different from casual and 丁寧語 forms. The word for 'to eat' in 謙譲語 is いただきます."),
            templateFillInBlankQuestion(context, _questions[0]),
            templateFillInBlankQuestion(context, _questions[1]),
            templateFillInBlankQuestion(context, _questions[2]),
            templateFillInBlankQuestion(context, _questions[3]),
            templateFillInBlankQuestion(context, _questions[4]),
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
