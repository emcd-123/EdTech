import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../project/classes/database_classes.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final textController = TextEditingController();
  int? selectedId;
  // final Future<List<Review>> _reviewSchedule =
  //     DatabaseHelper.instance.getReviewSchedule();

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
                "Database Screen: Currently using to test the sqflite database"),
            TextField(
              controller: textController,
            ),
            Center(
              child: FutureBuilder<List<Review>>(
                  future: DatabaseHelper.instance
                      .getReviewSchedule(), //_reviewSchedule,
                  //TODO: CHANGE THIS BACK
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Review>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Loading..."),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      log("data is empty");
                      return const Center(
                        child: Text("No Reviews Today"),
                      );
                    } else {
                      log(snapshot.data![0].lessonName.toString());
                      // return Center(
                      //     child: Text(snapshot.data![0].lessonName.toString()));
                      return SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              // color: selectedId == snapshot.data![index].id
                              //     ? Colors.white70
                              //     : Colors.white,
                              color: snapshot.data![index].nextReview
                                      .isBefore(DateTime.now())
                                  ? Colors.orange
                                  : Colors.blue,
                              child: ListTile(
                                title: Text(snapshot.data![index].lessonName
                                    .toString()),
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null) {
                                      textController.text =
                                          snapshot.data![index].lessonName;
                                      selectedId = snapshot.data![index].id;
                                    } else {
                                      textController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    DatabaseHelper.instance
                                        .remove(snapshot.data![index].id!);
                                    selectedId = null;
                                  });
                                },
                              ),
                            );
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
          log(selectedId.toString());
          selectedId != null
              ? await DatabaseHelper.instance
                  .updateReviewAddDaysById(selectedId!, 3)
              : await DatabaseHelper.instance.addReview(Review(
                  lessonName: textController.text,
                  nextReview: DateTime.now(),
                  reviewStrength: 1));
          setState(() {
            textController.clear();
            selectedId = null;
          });
        },
      ),
    );
  }
}
