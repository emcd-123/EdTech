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
        iconPath: "assets/svg/sakura.svg",
        lessonPath: "/what_is_keigo"));

    lessons.add(LessonList(
        topic: "Why Learn Keigo?",
        iconPath: "assets/svg/koi.svg",
        lessonPath: "/why_learn_keigo"));

    lessons.add(LessonList(
        topic: "When to Use Keigo",
        iconPath: "assets/svg/bamboo.svg",
        lessonPath: "/when_to_use"));

    lessons.add(LessonList(
        topic: "Levels of Respect",
        iconPath: "assets/svg/kimono.svg",
        lessonPath: "/levels_of_respect"));

    lessons.add(LessonList(
        topic: "To Be: だ",
        iconPath: "assets/svg/ninja.svg",
        lessonPath: "/copula"));

    lessons.add(LessonList(
        topic: "食べる・飲む",
        iconPath: "assets/svg/sushi.svg",
        lessonPath: "/taberu_nomu"));

    lessons.add(LessonList(
        topic: "To Exist: いる",
        iconPath: "assets/svg/fuji.svg",
        lessonPath: "/iru"));

    lessons.add(
      LessonList(
        topic: "To Do: する",
        iconPath: "assets/svg/sake.svg",
        lessonPath: "/suru",
      ),
    );

    lessons.add(
      LessonList(
        topic: "To Go: 行く",
        iconPath: "assets/svg/letter.svg",
        lessonPath: "/iku",
      ),
    );

    lessons.add(
      LessonList(
          topic: "To Come: 来る",
          iconPath: "assets/svg/torii.svg",
          lessonPath: "/kuru"),
    );

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/svg/noodles.svg",
        lessonPath: "lesson/Path"));

    lessons.add(LessonList(
        topic: "work in progress",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "lesson/Path"));

    return lessons;
  }
}
