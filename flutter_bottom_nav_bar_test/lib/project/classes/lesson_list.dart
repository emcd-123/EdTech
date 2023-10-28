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
        topic: "Why Learn Keigo?",
        iconPath: "assets/koi.svg",
        lessonPath: "/why_learn_keigo"));

    lessons.add(LessonList(
        topic: "When to Use Keigo",
        iconPath: "assets/bamboo.svg",
        lessonPath: "/when_to_use"));

    lessons.add(LessonList(
        topic: "Levels of Respect",
        iconPath: "assets/kimono.svg",
        lessonPath: "/levels_of_respect"));

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
