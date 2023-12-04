import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/lesson_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  List<LessonList> lessons = [];

  void _getLessons() {
    lessons = LessonList.getLessonList();
  }

  // @override
  // void initState() {
  //   _getLessons();
  // }

  @override
  Widget build(BuildContext context) {
    _getLessons();
    return Scaffold(
      appBar: AppBar(title: const Text("Keigo Dojo")),
      body: Center(
        child: _lessonsButtons(),
      ),
    );
  }

  SizedBox _lessonsButtons() {
    return SizedBox(
      child: Scrollbar(
        child: ListView.separated(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
          itemCount: lessons.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(lessons[index].lessonPath);
              },
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 1,
                      blurRadius: 8,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  //border: Border.all(width: 4, color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(120, 158, 158, 158),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        lessons[index].iconPath,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text(
                      lessons[index].topic,
                      style: Theme.of(context).textTheme.titleMedium,
                      // You can also use style: to style the text here
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
