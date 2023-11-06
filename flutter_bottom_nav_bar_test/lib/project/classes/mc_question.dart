import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:provider/provider.dart';
import 'mc_answer.dart';

class MCQuestion extends StatefulWidget {
  Map<String, Object> question;

  MCQuestion({
    super.key,
    required this.question,
  });

  @override
  State<MCQuestion> createState() => _MCQuestionState();
}

class _MCQuestionState extends State<MCQuestion> {
  bool answerWasSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Text(
                  widget.question['question'].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(widget.question['answers'] as List<Map<String, dynamic>>)
                .map((e) => MCAnswer(
                      answerText: e['answerText'],
                      answerScore: e['score'],
                    ))
          ],
        ),
      ),
    );
  }
}
