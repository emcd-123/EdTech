//This class is for the multiple choice question answers
import 'package:flutter/material.dart';

class MCAnswer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final void Function() answerTap;

  const MCAnswer(
      {super.key,
      required this.answerText,
      required this.answerColor,
      required this.answerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: answerColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: Text(answerText),
      ),
    );
  }
}
