import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
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

  _buildMessageComposer(formKey, answers) {
    List affixes = widget.question['affixes'] as List;
    String tooltipAnswer = answers[0];
    String tooltipAnswerRomaji = answers[2];
    String tooltipLessonName = widget.lessonName;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 70,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            widget.reviewOrExtra != 'r'
                ? JustTheTooltip(
                    preferredDirection: AxisDirection.up,
                    elevation: 8,
                    isModal: true,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Answer: $tooltipAnswer ($tooltipAnswerRomaji)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    child: const Material(
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.help,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : (buttonWasPressed
                    ? JustTheTooltip(
                        preferredDirection: AxisDirection.up,
                        elevation: 8,
                        isModal: true,
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            correctAnswerWasSelected
                                ? "Check out the lesson on $tooltipLessonName for more help"
                                : "Answer: $tooltipAnswer ($tooltipAnswerRomaji)",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        child: const Material(
                          color: Colors.white,
                          shape: CircleBorder(),
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.help,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()),
            Expanded(
              child: Form(
                key: formKey,
                child: Consumer(
                  builder: (BuildContext context,
                          ScoreKeeperProvider scoreKeeperProvider,
                          Widget? child) =>
                      TextFormField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        prefix: Text(
                          affixes[0],
                          style: const TextStyle(color: Colors.black),
                        ),
                        suffix: Text(affixes[1],
                            style: const TextStyle(color: Colors.black)),
                        hintText: "      "),
                    validator: (value) {
                      value = value!.toLowerCase().trim();
                      if (correctAnswerWasSelected == false &&
                          answers.contains(value)) {
                        scoreKeeperProvider.addTotalScore();
                        correctAnswerWasSelected = true;
                        buttonWasPressed = true;
                        log("correct answer selected and button pressed");
                        if (wasSRSUpdated == false &&
                            widget.reviewOrExtra == "r") {
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
                        if (wasSRSUpdated == false &&
                            widget.reviewOrExtra == "r") {
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
                        // _textEditingController.clear();
                        if (wasSRSUpdated == false &&
                            widget.reviewOrExtra == "r") {
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
                      if (wasSRSUpdated == false &&
                          widget.reviewOrExtra == "r") {
                        // _textEditingController.clear();
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
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
                setState(() {});
              },
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
    List<String> answers = widget.question['answers'] as List<String>;
    final formKey = GlobalKey<FormState>();
    final GlobalKey<AnimatedListState> _listKey =
        GlobalKey<AnimatedListState>();

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

    int bubbleNum = widget.question['answerBubble'] as int;

    List animatedBubbles;
    if (correctAnswerWasSelected) {
      animatedBubbles = chat.sublist(bubbleNum, chat.length);
    } else {
      animatedBubbles = [];
    }
    log("BEOFRE THE RETURN");

    return Consumer<ScoreKeeperProvider>(
      builder: (BuildContext context, ScoreKeeperProvider scoreKeeperProvider,
          Widget? child) {
        log("AFTER THE CONSUMER");
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  widget.image != ""
                      ? Column(
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
                              width: MediaQuery.of(context).size.width /
                                  mediaWidth,
                            ),
                          ],
                        )
                      : const Text(
                          "Complete the conversation:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  for (var bubble in chat.sublist(0, bubbleNum)) bubble,
                  for (int i = 0; i < animatedBubbles.length; i++)
                    Container(
                      child: animatedBubbles[i],
                    )
                        .animate(
                            delay: Duration(milliseconds: (2500 * i - 1) + 100))
                        .fade(duration: 100.ms, end: 1, begin: 0)
                        .scale(begin: const Offset(0, 0))
                        .move(
                            begin: animatedBubbles[i].isCurrentUser
                                ? const Offset(400, 75)
                                : const Offset(-400, 75))
                ]),
              ),
              //TODO: THIS NEED TO BE FIXED SO THAT IT WILL SHOW UP CORRECTLY ONCE IN THE INPUT IS USED MULTIPLE TIMES
              buttonWasPressed
                  ? Text(
                      correctAnswerWasSelected ? "Well Done!" : "Try Again",
                      style: TextStyle(
                          color: correctAnswerWasSelected
                              ? Colors.green
                              : Colors.red),
                    )
                      .animate(
                          delay: correctAnswerWasSelected
                              ? Duration(
                                  milliseconds:
                                      ((1500 * animatedBubbles.length - 2)))
                              : const Duration(milliseconds: 750))
                      .fadeIn(duration: 0.ms)
                      .fadeOut(delay: 1000.ms, duration: 500.ms)
                  : const SizedBox(),
              _buildMessageComposer(formKey, answers)
            ],
          ),
        );
      },
    );
  }
}
