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

  // ALL THE SVGS WERE FOUND ON SVGREPO.COM GO THERE TO FIND MORE
  static List<LessonList> getLessonList() {
    List<LessonList> lessons = [];

    lessons.add(LessonList(
        topic: "what_is_keigo",
        iconPath: "assets/sakura.svg",
        lessonPath: "lesson/path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/paper-crane.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/bamboo.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/kimono.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/ninja.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/fuji.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/sushi.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/sake.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/letter.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/torii.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/noodles.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "humble_vs_polite",
        iconPath: "assets/bento.svg",
        lessonPath: "lesson/Path"));

    return lessons;
  }
}
