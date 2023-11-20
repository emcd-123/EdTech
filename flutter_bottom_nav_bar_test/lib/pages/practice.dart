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
  final Future<List<Review>> _reviewSchedule =
      DatabaseHelper.instance.getReviewSchedule();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Keigo Dojo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                  'The lessons generated right now are not connected to the spaced repetition system, but they will be'),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/practice_lesson');
                  log(exercises['meishi']![0].toString());
                },
                child: const Text("Start Practice Session"),
              ),
            ],
          ),
        ));
  }
}
