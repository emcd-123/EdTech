import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String lesson_name;
  final String lesson_path;
  final String lesson_image;

  const MyWidget(
      {super.key,
      required this.lesson_name,
      required this.lesson_path,
      required this.lesson_image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          elevation: 10,
          child: InkWell(
            onTap: () {},
            child: Container(height: 60, width: 220),
          )),
    );
  }
}
/// I might not actually need this? 