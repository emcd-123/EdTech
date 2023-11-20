import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String lessonName;
  final String lessonPath;
  final String lessonImage;

  const MyWidget(
      {super.key,
      required this.lessonName,
      required this.lessonPath,
      required this.lessonImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          elevation: 10,
          child: InkWell(
            onTap: () {},
            child: const SizedBox(height: 60, width: 220),
          )),
    );
  }
}
/// I might not actually need this? 