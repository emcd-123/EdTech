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

class _FillInBlankQuestionState extends State<FillInBlankQuestion>
    with AutomaticKeepAliveClientMixin<FillInBlankQuestion> {
  final TextEditingController _textEditingController = TextEditingController();
  bool answerWasSelected = false;
  bool buttonWasPressed = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<String> answers = widget.question['answers'] as List<String>;
    final formKey = GlobalKey<FormState>();
    Iterable<String> splitStatement = widget.question['question']
        .toString()
        .replaceAll("___", " @ ")
        .split(" ")
        .map((e) => "$e ");

    Iterable<Widget> splitWidget = splitStatement //.where((e) => e == "@ ")
        .map((e) {
      if (e != "@ ") {
        //TODO:1 Probably not the most secure way to do this, so find some other way later
        return Text(
          e,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
      return Form(
        key: formKey,
        child: Consumer(
          builder: (BuildContext context,
                  ScoreKeeperProvider scoreKeeperProvider, Widget? child) =>
              TextFormField(
            decoration: const InputDecoration(
                constraints: BoxConstraints(maxHeight: 40, maxWidth: 100)),
            autofocus: true,
            validator: (value) {
              if (answerWasSelected == false && answers.contains(value)) {
                scoreKeeperProvider.addTotalScore();
                answerWasSelected = true;
                buttonWasPressed = true;
                return "Correct";
              } else if (answerWasSelected == true && answers.contains(value)) {
                buttonWasPressed = true;
                return "Correct again";
              }
              //TODO: I don't like how this incorrect message is displayed, so change it later
              buttonWasPressed = true;
              return "Incorrect";
            },
          ),
        ),
      );
    });

    final List<Widget> splitList = splitWidget.toList();
    log(splitList.toString());

    return Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
              Widget? child) =>
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: MediaQuery.of(context).size.height / 5,
              child: Center(
                child: Flexible(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.start,
                    spacing: 0,
                    direction: Axis.horizontal,
                    children: splitList,
                  ),
                ),
              ),
            ),
            Text(
              answerWasSelected ? "Well Done!" : "Try Again",
              style: TextStyle(
                  color: buttonWasPressed
                      ? answerWasSelected
                          ? Colors.green
                          : Colors.red
                      : Colors.white),
            ),
            ElevatedButton(
                //TODO: Deal with the ParentDataWidget error
                onPressed: answerWasSelected
                    ? null
                    : () {
                        if (formKey.currentState!.validate()) {}
                        setState(() {});
                      },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
