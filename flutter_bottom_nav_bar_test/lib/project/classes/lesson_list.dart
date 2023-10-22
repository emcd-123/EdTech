import 'package:flutter/material.dart';

class LessonList {
  String topic;
  String iconPath;
  String lessonPath;

  LessonList({
    required this.topic,
    required this.iconPath,
    required this.lessonPath,
  });

  static List<LessonList> getLessonList() {
    List<LessonList> lessons = [];

    lessons.add(LessonList(
        topic: "what_is_keigo",
        iconPath: "assets/sakura.svg",
        lessonPath: "lesson/path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "icon/path",
        lessonPath: "lesson/Path"));

    return lessons;
  }
}
