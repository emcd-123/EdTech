//This class is for the multiple choice question answers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';

class MCAnswer extends StatefulWidget {
  final String answerText;
  final bool answerScore;

  MCAnswer({
    super.key,
    required this.answerText,
    required this.answerScore,
  });

  @override
  State<MCAnswer> createState() => _MCAnswerState();
}

class _MCAnswerState extends State<MCAnswer> {
  /*answerWasSelected
                          ? e['score']
                              ? Colors.green
                              : Colors.red
                          : Colors.white,*/

  bool wasTapped = false;
  bool answered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          InkWell(
        onTap: () {
          wasTapped = true;
          if (widget.answerScore == true && answered == false) {
            scoreKeeperProvider.addTotalScore();
            answered = true;
          } else {
            scoreKeeperProvider.refresh();
          }
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: wasTapped
                ? widget.answerScore
                    ? Colors.green
                    : Colors.red
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),
          child: Text(widget.answerText),
        ),
      ),
    );
  }
}
