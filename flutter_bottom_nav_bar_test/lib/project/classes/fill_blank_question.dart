import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:provider/provider.dart';

class FillInBlankQuestion extends StatefulWidget {
  Map<String, Object> question;

  FillInBlankQuestion({super.key, required this.question});

  @override
  State<FillInBlankQuestion> createState() => _FillInBlankQuestionState();
}

class _FillInBlankQuestionState extends State<FillInBlankQuestion> {
  final TextEditingController _textEditingController = TextEditingController();
  bool answerWasSelected = false;

  @override
  Widget build(BuildContext context) {
    List<String> splitStatement = widget.question['question']
        .toString()
        .replaceAll("___", "_@_")
        .split("_");
    List<String> answers = widget.question['answers'] as List<String>;
    final _formKey = GlobalKey<FormState>();

    return Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Fill in the Blank:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      splitStatement[0],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (answerWasSelected == false &&
                              answers.contains(value)) {
                            scoreKeeperProvider.addTotalScore();
                            answerWasSelected = true;
                            return "Correct";
                          } else if (answerWasSelected == true &&
                              answers.contains(value)) {
                            return "Correct again";
                          }
                          return "Incorrect answer, try again";
                        },
                      ),
                    ),
                    Text(
                      splitStatement[2],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    log(_formKey.currentState!.validate() as String);
                  }
                  //_answerWasSelected = true;
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
