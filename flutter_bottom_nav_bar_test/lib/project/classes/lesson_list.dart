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
        topic: "What is Keigo?",
        iconPath: "assets/sakura.svg",
        lessonPath: "/what_is_keigo"));

    lessons.add(LessonList(
        topic: "When to use Keigo?",
        iconPath: "assets/paper-crane.svg",
        lessonPath: "lessons/when_is_keigo"));

    lessons.add(LessonList(
        topic: "Sonkeigo vs Kenjougo",
        iconPath: "assets/bamboo.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "In-groups and Out-groups",
        iconPath: "assets/kimono.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "召し上がる・いただく",
        iconPath: "assets/ninja.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/fuji.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/sushi.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/sake.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/letter.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/torii.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/noodles.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/bento.svg",
        lessonPath: "lesson/Path"));

    return lessons;
  }
}
