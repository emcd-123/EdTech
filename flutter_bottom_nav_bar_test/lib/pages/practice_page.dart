import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sqflite/sqflite.dart';

import '../project/classes/database_classes.dart';

import '../project/exercises/exercises.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final textController = TextEditingController();
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Keigo Dojo")),
        body: Center(
          child: FutureBuilder(
            future: DatabaseHelper.instance.getReviewsDue(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Review>> snapshot) {
              //Reviews due text
              String howManyReviewsText;
              List<Review>? reviewList = snapshot.data;

              if (reviewList.toString() == '[]') {
                howManyReviewsText =
                    "No reviews due now.\nWould you like to do extra practice?";
              } else {
                int? numberOfReviews = reviewList?.length;

                howManyReviewsText =
                    "You have $numberOfReviews lessons to review. Click the button to get started!";
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(
                        howManyReviewsText,
                        textAlign: TextAlign.center,
                      )),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/practice_lesson');
                    },
                    child: const Text("Start Practice Session"),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
