import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/lesson_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;

class LearnScreen extends StatefulWidget {
  LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  List<LessonList> lessons = [];

  void _getLessons() {
    lessons = LessonList.getLessonList();
  }

  @override
  void initState() {
    _getLessons();
  }

  @override
  Widget build(BuildContext context) {
    _getLessons();
    return Scaffold(
      appBar: AppBar(title: const Text("Keigo Dojo")),
      body: Center(
        child: SizedBox(
          width: 350,
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 15),
            itemCount: lessons.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 4, color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      // child: SvgPicture.asset(lessons[index].iconPath),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
