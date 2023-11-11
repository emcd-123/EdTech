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
  String nextReview;
  int reviewStrength;

  Review(
      {this.id,
      required this.lessonName,
      required this.nextReview,
      required this.reviewStrength});

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        id: json['id'],
        lessonName: json['lessonName'],
        nextReview: json['nextReview'],
        reviewStrength: json['reviewStrength'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lessonName': lessonName,
      'nextReview': nextReview,
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
    //TODO: DELETE THIS LATER IT IS ONLY FOR DEBUGGING
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, 'spaced_repetition.db');
    // deleteDatabase(path);
    log("in review schedule");
    Database db = await instance.database;
    log("got database instance");

    // TODO: DELETE THIS LATER IT IS HERE FOR DEBUGGING
    // remove(1);

    log("removed query");
    var lessonsToReview =
        await db.query('review_schedule', orderBy: 'nextReview');
    log('got lessons query');
    log(lessonsToReview.toString());
    List<Review> reviewList = lessonsToReview.isNotEmpty
        ? lessonsToReview.map((c) => Review.fromMap(c)).toList()
        : [];
    log('created a review list');
    // log(reviewList[0].lessonName.toString());
    return reviewList;
  }

  // Add a new review into the review schedule database
  Future<int> addReview(Review review) async {
    log("adding a review ");
    Database db = await instance.database;
    return await db.insert('review_schedule', review.toMap());
  }

  Future<int> remove(int id) async {
    log("removing a review");
    Database db = await instance.database;
    return await db.delete('review_schedule', where: 'id=?', whereArgs: [id]);
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
