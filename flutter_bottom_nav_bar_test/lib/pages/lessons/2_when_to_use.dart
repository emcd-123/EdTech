import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/libraries/page_templates.dart';

class LessonWhenToUse extends StatefulWidget {
  const LessonWhenToUse({super.key});

  @override
  State<LessonWhenToUse> createState() => _LessonWhenToUseState();
}

class _LessonWhenToUseState extends State<LessonWhenToUse> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Who should you use keigo with?',
      'questionType': "multipleChoice",
      'answers': [
        {'answerText': 'A younger child', 'score': false},
        {'answerText': 'Your cousin', 'score': false},
        {'answerText': 'The company president', 'score': true},
      ],
    },
    {
      'question': 'Who will you likely use casual language with?',
      'questionType': "multipleChoice",
      'answers': [
        {'answerText': 'A stranger', 'score': false},
        {'answerText': 'Your sibling', 'score': true},
        {'answerText': 'An old man', 'score': false},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<ScoreKeeperProvider>(context, listen: false)
        .initializeReqScore(_questions.length);

    return Consumer<ScoreKeeperProvider>(
        builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
                Widget? child) =>
            Scaffold(
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
                        "assets/irasutoya/study_nihongo.png",
                        "When is Keigo used?"),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "Before diving into the nuances of Keigo, it is important to first discuss when it is used. There are some situations where you will use Keigo and other situations where it is better to use casual forms, also known as タメ口 or タメ語."),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "There are many factors to consider when deciding which form to use, but the two most important factors to consider are who you are talking to and the context you are in."),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "As for who you are talking to, it depends on how close of a relationship you have to them. With family and friends, you will usually use casual language. People that you are meeting for the first time, teachers, and coworkers are all different people that you would use some form of keigo with"),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "One of the most important factors for who you are talking to is age. Keigo is usually used when addressing someone older than yourself, and casual form is used when talking to someone younger."),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "Context also plays an important role. For example, in business settings, keigo might exclusively be used."),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "That being said, there are exceptions to these rules. For example, an older classmate or friend may prefer that you use casual language with them even though they are older"),
                    templatePageInfo(
                        context,
                        "assets/irasutoya/study_nihongo.png",
                        "Given the complexity of keigo, Japanese speakers will not usually find it rude if a non-native speaker uses the wrong form. This topic can even be tricky for Japanese people sometimes, and they will recognize and appreciate the effort. The important thing is that you are making an effort to learn this language."),
                    templateMultipleChoiceQuestion(context, _questions[0]),
                    templateMultipleChoiceQuestion(context, _questions[1]),
                    templateLessonComplete(context, "やった！", "when_keigo"),
                  ],
                ),
              ),
            ));
  }
}
