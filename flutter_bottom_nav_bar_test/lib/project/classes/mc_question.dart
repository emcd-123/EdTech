import 'package:flutter/material.dart';

import 'mc_answer.dart';

class MCQuestion extends StatefulWidget {
  Map<String, Object> question;
  final Function(int) notifyParent;
  int totalScore;

  MCQuestion({
    super.key,
    required this.question,
    required this.notifyParent,
    required this.totalScore,
  });

  @override
  State<MCQuestion> createState() => _MCQuestionState();
}

class _MCQuestionState extends State<MCQuestion> {
  bool answerWasSelected = false;

  void _questionAnswered(bool answerScore, int totalScore) {
    setState(() {
      //answer was selected
      answerWasSelected = true;

      if (answerScore) {
        totalScore++;
        widget.notifyParent(totalScore);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    answerColor: answerWasSelected
                        ? e['score']
                            ? Colors.green
                            : Colors.grey
                        : Colors.white,
                    answerTap: () {
                      _questionAnswered(e['score'], widget.totalScore);
                    },
                  ))
        ],
      ),
    );
  }
}
