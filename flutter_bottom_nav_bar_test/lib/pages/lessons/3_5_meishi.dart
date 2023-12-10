import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../project/classes/providers.dart';
import '../../project/libraries/page_templates.dart';

class LessonMeishi extends StatefulWidget {
  const LessonMeishi({super.key});

  @override
  State<LessonMeishi> createState() => _LessonMeishiState();
}

class _LessonMeishiState extends State<LessonMeishi> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Fill in the correct prefix: ___水.',
      'questionType': "fillInTheBlank",
      'answers': ['お', '御', 'o'],
    },
    {
      'question': 'Fill in the correct prefix: ___満足.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', '御', 'go'],
    },
    {
      'question': 'Fill in the correct prefix: ___名前.',
      'questionType': "fillInTheBlank",
      'answers': ['お', '御', 'o'],
    },
    {
      'question': 'Fill in the correct prefix: ___米.',
      'questionType': "fillInTheBlank",
      'answers': ['お', '御', 'o'],
    },
    {
      'question': 'Fill in the correct prefix: ___気分.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', '御', 'go'],
    },
    {
      'question': 'Fill in the correct prefix: ___質問.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', '御', 'go'],
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
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          children: [
            templateTitlePage(context, "assets/irasutoya/message_ogenkide.png",
                "Honorific Prefixes:\nお and ご"),
            templatePageInfo(context, "assets/irasutoya/happy_schoolgirl.png",
                "Given that keigo is a topic that intermediate or advanced Japanese language learners are mostly interested in, it is assumed that you are already fairly familiar with 丁寧語 (teineigo). Therefore, you should already be somewhat familar with this topic."),
            templatePageInfo(context, "assets/irasutoya/text_go_o.png",
                "When using keigo, there are some words that will have an お (o) or ご (go) attached to them. You should be familiar with this from phrases such as お元気ですか (o genki desu ka) or お名前は何ですか (o namae wa nan desu ka). Adding this お (o) or ご (go) helps make the word sound more polite."),
            templatePageInfo(context, "assets/irasutoya/kinshi_oshaberi.png",
                "Similarly to when using 尊敬語 (sonkeigo), you do not want to attach an お (o) or ご (go) to words that are referencing yourself since showing respect to yourself like this could seem immodest. This is why the response to お元気ですか (o genki desu ka) is 元気です (genki desu) and not お元気です (o genki desu)."),
            templatePageInfo(context, "assets/irasutoya/gohan.png",
                "Some words will almost always appear with their prefix. For example, the word for meal, ご飯 (gohan), almost always has the ご (go) in front of it."),
            templatePageInfo(context, "assets/irasutoya/graph_man_serious.png",
                "So how do you know whether to add a お or ご prefix? It depends on the etymology of the word. If the word uses 訓読み (kunyomi), also known as the Japanese reading, it will have an お as a prefix. Words with 訓読み (kunyomi) readings that use お include お酒 (osake), お茶 (ocha), お仕事 (oshigoto) and お寿司 (osushi). If the word uses 音読み (onyomi), also known as the Chinese reading, it will use ご as a prefix. Words that use ご as a prefix include ご両親 (goryoushin), ご家族 (gokazoku), and ご協力 (gokyouryoku).",
                tooltip:
                    "There is also a tendency for everyday items and foods to use お as a prefix and for more abstract concepts to use ご.",
                longText: true),
            templateFillInBlankQuestion(context, _questions[0]),
            templateFillInBlankQuestion(context, _questions[1]),
            templateFillInBlankQuestion(context, _questions[2]),
            templateFillInBlankQuestion(context, _questions[3]),
            templateFillInBlankQuestion(context, _questions[4]),
            templateFillInBlankQuestion(context, _questions[5]),
            templateLessonComplete(
                context,
                "Nice job! You now know the honorific prefixes お and ご",
                "honorific_prefix"),
          ],
        ),
      ),
    );
  }
}
