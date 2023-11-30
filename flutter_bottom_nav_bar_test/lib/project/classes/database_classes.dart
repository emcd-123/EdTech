import 'dart:developer';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// This youtube video was used to help set up the database:
// https://www.youtube.com/watch?v=noi6aYsP7Go

// Database Entry Classes
class Review {
  final int? id;
  final String lessonName;
  DateTime nextReview;
  int reviewStrength;

  Review(
      {this.id,
      required this.lessonName,
      required this.nextReview,
      required this.reviewStrength});

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        id: json['id'],
        lessonName: json['lessonName'],
        nextReview: DateTime.parse(json['nextReview']),
        reviewStrength: json['reviewStrength'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lessonName': lessonName,
      'nextReview': nextReview.toString(),
      'reviewStrength': reviewStrength,
    };
  }
}

// Database Helper
class DatabaseHelper {
  // For the singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  // initialize the database (where it goes in the phone's storage)
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'spaced_rep.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    //TODO: CREATE A SECOND TABLE FOR THE QUESTIONS
    await db.execute('''
      CREATE TABLE review_schedule(
        id INTEGER PRIMARY KEY,
        lessonName TEXT,
        nextReview TEXT,
        reviewStrength INT
      )
    ''');
  }

  // Returns all reviews and their times
  Future<List<Review>> getReviewSchedule() async {
    Database db = await instance.database;

    var lessonsToReview =
        await db.query('review_schedule', orderBy: 'nextReview');
    log(lessonsToReview.toString());
    List<Review> reviewList = lessonsToReview.isNotEmpty
        ? lessonsToReview.map((c) => Review.fromMap(c)).toList()
        : [];

    return reviewList;
  }

  Future<List<Review>> getReviewsDue() async {
    Database db = await instance.database;

    var lessonsToReview = await db.query('review_schedule',
        orderBy: 'nextReview',
        where: "nextReview < ?",
        whereArgs: [DateTime.now().toString()]);
    log(lessonsToReview.toString());
    List<Review> reviewList = lessonsToReview.isNotEmpty
        ? lessonsToReview.map((c) => Review.fromMap(c)).toList()
        : [];

    return reviewList;
  }

  // Add a new review into the review schedule database
  Future<int> addReview(Review review) async {
    Database db = await instance.database;
    var existingLesson = await db.query('review_schedule',
        where: 'lessonName == ?', whereArgs: [review.lessonName]);
    log(existingLesson.toString());
    if (existingLesson.isEmpty) {
      return await db.insert('review_schedule', review.toMap());
    } else {
      return -1;
    }
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('review_schedule', where: 'id=?', whereArgs: [id]);
  }

  // add these into update review days later
  int updateReviewStrength(int days, bool passed) {
    return passed ? (days * (3 / 2)).ceil() : 1;
  }

  // This function updates the database so that the review with id's nextReview is incremented n number of days
  Future<int> updateReviewAddDays(int id, int days) async {
    Database db = await instance.database;
    var data =
        await db.query("review_schedule", where: 'id = ?', whereArgs: [id]);

    Review updatedReview = Review.fromMap(data[0]);
    updatedReview.nextReview =
        updatedReview.nextReview.add(Duration(days: days));
    updatedReview.reviewStrength = days;
    log(updatedReview.toString());

    return await db.update('review_schedule', updatedReview.toMap(),
        where: 'id = ?', whereArgs: [id]);
  }

  // For debugging purposes
  Future<void> deleteAllTables() async {
    Database db = await instance.database;
    return await db.execute('''
      DROP TABLE review_schedule
    ''');
  }

  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);
}
