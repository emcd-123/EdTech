import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../project/classes/database_classes.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final textController = TextEditingController();
  final Future<List<Review>> _reviewSchedule =
      DatabaseHelper.instance.getReviewSchedule();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keigo Dojo"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
                "Practice Screen: Currently using to test the sqflite database"),
            TextField(
              controller: textController,
            ),
            Center(
              child: FutureBuilder<List<Review>>(
                  future: DatabaseHelper.instance
                      .getReviewSchedule(), //_reviewSchedule,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Review>> snapshot) {
                    if (!snapshot.hasData) {
                      log('in loading');
                      log(snapshot.toString());
                      return const Center(
                        child: Text("Loading..."),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      log("empty data");
                      log(snapshot as String);
                      return const Center(
                        child: Text("No Reviews Today"),
                      );
                    } else {
                      log("filled data");
                      log(snapshot.data![0].lessonName.toString());
                      log("but actually tho");
                      // return Center(
                      //     child: Text(snapshot.data![0].lessonName.toString()));
                      return SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(snapshot.data![index].lessonName
                                    .toString()));
                          },
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          await DatabaseHelper.instance.addReview(Review(
              lessonName: textController.text,
              nextReview: "z",
              reviewStrength: 1));
          setState(() {
            log("state set");
            textController.clear();
          });
        },
      ),
    );
  }
}
