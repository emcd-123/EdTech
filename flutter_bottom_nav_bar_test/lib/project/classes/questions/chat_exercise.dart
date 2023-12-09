import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database_classes.dart';
import '../providers.dart';

abstract class ChatListItem {}

class ChatBubble extends StatelessWidget {
  @override
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);
  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(
          isCurrentUser ? 64 : 16, 4, isCurrentUser ? 16 : 64, 4),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.red : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                text,
                style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black87),
              )),
        ),
      ),
    );
  }
}

class ChatQuestion extends StatefulWidget {
  Map<String, Object> question;
  String reviewOrExtra;
  String lessonName;
  String image;

  ChatQuestion({
    super.key,
    required this.question,
    required this.reviewOrExtra,
    required this.lessonName,
    required this.image,
  });

  @override
  State<ChatQuestion> createState() => _ChatQuestionState();
}

class _ChatQuestionState extends State<ChatQuestion>
    with AutomaticKeepAliveClientMixin<ChatQuestion> {
  final TextEditingController _textEditingController = TextEditingController();

  bool correctAnswerWasSelected = false;
  bool buttonWasPressed = false;
  bool wasSRSUpdated = false;
  DatabaseHelper db = DatabaseHelper.instance;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  _buildMessageComposer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 70,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(hintText: "here"),
            )),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
              iconSize: 25,
              color: Theme.of(context).primaryColor,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // List<String> answers = widget.question['answers'] as List<String>;
    // final formKey = GlobalKey<FormState>();
    // Iterable<String> splitStatement = widget.question['question']
    //     .toString()
    //     .replaceAll("___", " @ ")
    //     .split(" ")
    //     .map((e) => "$e ");

    // Iterable<Widget> splitWidget = splitStatement //.where((e) => e == "@ ")
    //     .map((e) {
    //   if (e != "@ ") {
    //     return Text(
    //       e,
    //       style: const TextStyle(
    //         fontSize: 20,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     );
    //   }
    //   return Form(
    //     key: formKey,
    //     child: Consumer(
    //       builder: (BuildContext context,
    //               ScoreKeeperProvider scoreKeeperProvider, Widget? child) =>
    //           TextFormField(
    //         decoration: const InputDecoration(
    //             constraints: BoxConstraints(maxHeight: 40, maxWidth: 100)),
    //         autofocus: true,
    //         validator: (value) {
    //           value = value!.toLowerCase().trim();
    //           if (correctAnswerWasSelected == false &&
    //               answers.contains(value)) {
    //             scoreKeeperProvider.addTotalScore();
    //             correctAnswerWasSelected = true;
    //             buttonWasPressed = true;
    //             log("correct answer selected and button pressed");
    //             if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
    //               db.updateReviewAddDays(
    //                 widget.lessonName,
    //                 true,
    //               );
    //               wasSRSUpdated = true;
    //             }

    //             return "Correct";
    //           } else if (correctAnswerWasSelected == true &&
    //               answers.contains(value)) {
    //             buttonWasPressed = true;
    //             log("button was already pressed but answer is still correct");
    //             if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
    //               db.updateReviewAddDays(
    //                 widget.lessonName,
    //                 true,
    //               );
    //               wasSRSUpdated = true;
    //             }

    //             return "Correct again";
    //           } else if (correctAnswerWasSelected == true &&
    //               !answers.contains(value)) {
    //             correctAnswerWasSelected = false;
    //             log("incorrect answer chosen");
    //             if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
    //               db.updateReviewAddDays(
    //                 widget.lessonName,
    //                 false,
    //               );
    //               wasSRSUpdated = true;
    //             }
    //             return "Incorrect";
    //           }
    //           //TODO: I don't like how this incorrect message is displayed, so change it later
    //           buttonWasPressed = true;
    //           if (wasSRSUpdated == false && widget.reviewOrExtra == "r") {
    //             db.updateReviewAddDays(
    //               widget.lessonName,
    //               false,
    //             );
    //             wasSRSUpdated = true;
    //           }
    //           log("incorrect answer");
    //           return "Incorrect";
    //         },
    //       ),
    //     ),
    //   );
    // });

    // final List<Widget> splitList = splitWidget.toList();
    // log(splitList.toString());

    int mediaWidth = 2;

    log(widget.image.toString());
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

    List<Widget> chat = widget.question["question"] as List<Widget>;
    log(widget.image.toString());

    log("BEOFRE THE RETURN");

    return Consumer<ScoreKeeperProvider>(builder: (BuildContext context,
            ScoreKeeperProvider scoreKeeperProvider, Widget? child) {
      log("AFTER THE CONSUMER");
      return Expanded(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Complete the conversation:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Image(
                  image: AssetImage(widget.image),
                  width: MediaQuery.of(context).size.width / mediaWidth,
                ),
              ],
            )
            // widget.image == ""
            //     ? const Text(
            //         "Complete the conversation:",
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       )
            //     : Column(
            //         children: [
            //           const SizedBox(
            //             height: 15,
            //           ),
            //           const Text(
            //             "Complete the conversation:",
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 15,
            //           ),
            //           Image(
            //             image: AssetImage(widget.image),
            //             width: MediaQuery.of(context).size.width / mediaWidth,
            //           ),
            //         ],
            //       )
          ],
        ),
      );
    }

        // _buildMessageComposer()
//
        //
        // Align(
        //     alignment: Alignment.bottomLeft,
        //     child: Container(
        //       padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
        //       height: 60,
        //       width: double.infinity,
        //       color: Colors.white,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           const Wrap(
        //             crossAxisAlignment: WrapCrossAlignment.center,
        //             alignment: WrapAlignment.start,
        //             spacing: 0,
        //             direction: Axis.horizontal,
        //             children: [
        //               Text("here "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //               Text("data "),
        //             ],
        //           ),
        //           const SizedBox(
        //             width: 15,
        //           ),
        //           FloatingActionButton(
        //             onPressed: () {},
        //             backgroundColor: Colors.red,
        //             elevation: 0,
        //             child: const Icon(Icons.send,
        //                 color: Colors.white, size: 18),
        //           )
        //         ],
        //       ),
        //     ))
        // // SizedBox(
        // //   width: MediaQuery.of(context).size.width,
        // //   height: MediaQuery.of(context).size.height / 5,
        // //   child: Center(
        // //     child: Flexible(
        // //       child: Wrap(
        // //         crossAxisAlignment: WrapCrossAlignment.center,
        // //         alignment: WrapAlignment.start,
        // //         spacing: 0,
        // //         direction: Axis.horizontal,
        // //         children: splitList,
        // //       ),
        // //     ),
        // //   ),
        // // ),
        // Text(
        //   correctAnswerWasSelected ? "Well Done!" : "Try Again",
        //   style: TextStyle(
        //       color: buttonWasPressed
        //           ? correctAnswerWasSelected
        //               ? Colors.green
        //               : Colors.red
        //           : Colors.white),
        // ),
        // ElevatedButton(
        //     //TODO: Deal with the ParentDataWidget error
        //     onPressed: () {
        //       setState(() {});
        //       // if (formKey.currentState!.validate()) {}
        //     },
        //     child: const Text("Submit"))

        );
  }
  //TODO: PUT ONE MORE ELSE IF RIGHT HERE FOR EXTRAS
}
