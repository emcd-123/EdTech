import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:provider/provider.dart';

import '../database_classes.dart';

class FillInBlankQuestion extends StatefulWidget {
  Map<String, Object> question;
  String reviewOrExtra;
  String lessonName;
  String image;

  FillInBlankQuestion(
      {super.key,
      required this.question,
      required this.reviewOrExtra,
      required this.lessonName,
      required this.image});

  @override
  State<FillInBlankQuestion> createState() => _FillInBlankQuestionState();
}

class _FillInBlankQuestionState extends State<FillInBlankQuestion>
    with AutomaticKeepAliveClientMixin<FillInBlankQuestion> {
  final TextEditingController _textEditingController = TextEditingController();

  bool correctAnswerWasSelected = false;
  bool buttonWasPressed = false;
  bool wasSRSUpdated = false;
  DatabaseHelper db = DatabaseHelper.instance;

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
              value = value!.toLowerCase().trim();
              if (correctAnswerWasSelected == false &&
                  answers.contains(value)) {
                scoreKeeperProvider.addTotalScore();
                correctAnswerWasSelected = true;
                buttonWasPressed = true;
                log("correct answer selected and button pressed");
                if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
                  db.updateReviewAddDays(
                    widget.lessonName,
                    true,
                  );
                  wasSRSUpdated = true;
                }

                return "Correct";
              } else if (correctAnswerWasSelected == true &&
                  answers.contains(value)) {
                buttonWasPressed = true;
                log("button was already pressed but answer is still correct");
                if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
                  db.updateReviewAddDays(
                    widget.lessonName,
                    true,
                  );
                  wasSRSUpdated = true;
                }

                return "Correct again";
              } else if (correctAnswerWasSelected == true &&
                  !answers.contains(value)) {
                correctAnswerWasSelected = false;
                log("incorrect answer chosen");
                if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
                  db.updateReviewAddDays(
                    widget.lessonName,
                    false,
                  );
                  wasSRSUpdated = true;
                }
                return "Incorrect";
              }
              //TODO: I don't like how this incorrect message is displayed, so change it later
              buttonWasPressed = true;
              if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
                db.updateReviewAddDays(
                  widget.lessonName,
                  false,
                );
                wasSRSUpdated = true;
              }
              log("incorrect answer");
              return "Incorrect";
            },
          ),
        ),
      );
    });

    final List<Widget> splitList = splitWidget.toList();
    log(splitList.toString());

    int mediaWidth = 2;

    if (widget.image == "boss") {
      widget.image = "assets/irasutoya/boss_woman.png";
    } else if (widget.image == "me") {
      widget.image = "assets/irasutoya/kenjougo.jpg";
    } else if (widget.image == "stranger") {
      widget.image = "assets/irasutoya/yoroshiku_casual.png";
      mediaWidth = 1;
    } else if (widget.image == "friend") {
      widget.image = "assets/irasutoya/friend.jpg";
    }

    // if (widget.image == "") {
    log("BLANK WIDGET");
    return Consumer<ScoreKeeperProvider>(builder: (BuildContext context,
        ScoreKeeperProvider scoreKeeperProvider, Widget? child) {
      return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            widget.image == ""
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text("Fill in the Blank:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Image(
                          image: AssetImage(widget.image),
                          width: MediaQuery.of(context).size.width / mediaWidth,
                        ),
                      ]),
            // widget.image == "" ?
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height / 5,
            //   child: Center(
            //     child: Flexible(
            //       child: Wrap(
            //         crossAxisAlignment: WrapCrossAlignment.center,
            //         alignment: WrapAlignment.start,
            //         spacing: 0,
            //         direction: Axis.horizontal,
            //         children: splitList,
            //       ),
            //     ),
            //   ),
            // ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: widget.image == ''
                      ? MediaQuery.of(context).size.height / 5
                      : MediaQuery.of(context).size.height / 8,
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
                  correctAnswerWasSelected ? "Well Done!" : "Try Again",
                  style: TextStyle(
                      color: buttonWasPressed
                          ? correctAnswerWasSelected
                              ? Colors.green
                              : Colors.red
                          : Colors.white),
                ),
                ElevatedButton(
                    //TODO: Deal with the ParentDataWidget error
                    onPressed: () {
                      setState(() {});
                      if (formKey.currentState!.validate()) {}
                    },
                    child: const Text("Submit"))
              ],
            ),
          ]));
    });
    //TODO: PUT ONE MORE ELSE IF RIGHT HERE FOR EXTRAS
    // }
    // else {
    //   return Consumer<ScoreKeeperProvider>(
    //     builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
    //             Widget? child) =>
    //         Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           const SizedBox(
    //             height: 15,
    //           ),
    //           Image(
    //             image: AssetImage(widget.image),
    //             width: MediaQuery.of(context).size.width / mediaWidth,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width,
    //                 height: MediaQuery.of(context).size.height / 8,
    //                 child: Center(
    //                   child: Flexible(
    //                     child: Wrap(
    //                       crossAxisAlignment: WrapCrossAlignment.center,
    //                       alignment: WrapAlignment.start,
    //                       spacing: 0,
    //                       direction: Axis.horizontal,
    //                       children: splitList,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 correctAnswerWasSelected ? "Well Done!" : "Try Again",
    //                 style: TextStyle(
    //                     color: buttonWasPressed
    //                         ? correctAnswerWasSelected
    //                             ? Colors.green
    //                             : Colors.red
    //                         : Colors.white),
    //               ),
    //               ElevatedButton(
    //                   //TODO: Deal with the ParentDataWidget error
    //                   onPressed: correctAnswerWasSelected
    //                       ? null
    //                       : () {
    //                           if (formKey.currentState!.validate()) {}
    //                           setState(() {});
    //                         },
    //                   child: const Text("Submit")),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }
  }
}
