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
        topic: "Honorific Prefixes",
        iconPath: "assets/svg/ninja.svg",
        lessonPath: "/meishi"));

    lessons.add(LessonList(
        topic: "To Be: だ",
        iconPath: "assets/svg/sushi.svg",
        lessonPath: "/copula"));

    lessons.add(LessonList(
        topic: "食べる・飲む",
        iconPath: "assets/svg/fuji.svg",
        lessonPath: "/taberu_nomu"));

    lessons.add(LessonList(
        topic: "To Exist: いる",
        iconPath: "assets/svg/sake.svg",
        lessonPath: "/iru"));

    lessons.add(
      LessonList(
        topic: "To Do: する",
        iconPath: "assets/svg/letter.svg",
        lessonPath: "/suru",
      ),
    );

    lessons.add(
      LessonList(
        topic: "To Go: 行く",
        iconPath: "assets/svg/torii.svg",
        lessonPath: "/iku",
      ),
    );

    lessons.add(
      LessonList(
          topic: "To Come: 来る",
          iconPath: "assets/svg/noodles.svg",
          lessonPath: "/kuru"),
    );

    lessons.add(LessonList(
        topic: "内・外",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/uchi_soto"));

    lessons.add(LessonList(
        topic: "To Carry: 持っていく",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/motte"));

    lessons.add(LessonList(
        topic: "To See: 見る",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/miru"));

    lessons.add(LessonList(
        topic: "To Say: 言う",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/iu"));

    lessons.add(LessonList(
        topic: "To Think: 思う",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/omou"));

    lessons.add(LessonList(
        topic: "To Ask: 聞く",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/kiku"));

    lessons.add(LessonList(
        topic: "To Know: 知っている",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/shitteiru"));

    lessons.add(LessonList(
        topic: "To Read: 読む",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/yomu"));

    lessons.add(LessonList(
        topic: "あげる・くれる・もらう",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/ageru"));

    lessons.add(LessonList(
        topic: "To Wear: 着る",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/kiru"));

    lessons.add(LessonList(
        topic: "To Meet: 会う",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/au"));

    lessons.add(LessonList(
        topic: "To Live: 住む",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/sumu"));

    lessons.add(LessonList(
        topic: "To Sleep: 寝る",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/neru"));

    lessons.add(LessonList(
        topic: "To Die: 死ぬ",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/shinu"));

    lessons.add(LessonList(
        topic: "Other Verbs",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/nado"));

    lessons.add(
      LessonList(
        topic: "人・方",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/jin",
      ),
    );

    lessons.add(
      LessonList(
        topic: "年",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/toshi",
      ),
    );

    lessons.add(
      LessonList(
        topic: "さん・さま",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/sama",
      ),
    );

    lessons.add(
      LessonList(
        topic: "いかが",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/ikaga",
      ),
    );

    lessons.add(
      LessonList(
        topic: "どちら・こちら",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/dochira",
      ),
    );

    lessons.add(
      LessonList(
        topic: "少々",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/shoushou",
      ),
    );

    lessons.add(
      LessonList(
        topic: "明日",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/asu",
      ),
    );

    lessons.add(
      LessonList(
        topic: "まもなく",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/mamonaku",
      ),
    );

    lessons.add(
      LessonList(
        topic: "この間",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/kono_aida",
      ),
    );

    lessons.add(
      LessonList(
        topic: "昨日",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/sakujitsu",
      ),
    );

    lessons.add(
      LessonList(
        topic: "先ほど",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/sakihodo",
      ),
    );

    lessons.add(
      LessonList(
        topic: "とても",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/totemo",
      ),
    );

    lessons.add(
      LessonList(
        topic: "Summary",
        iconPath: "assets/svg/bento.svg",
        lessonPath: "/summary",
      ),
    );

    return lessons;
  }
}
