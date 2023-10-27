import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Container templateTitlePage(context, image, text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Image(image: AssetImage(image))
        ],
      ),
    ),
  );
}

Container templatePageInfo(context, image, text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(image: AssetImage(image)),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(text),
        )
      ],
    ),
  );
}

Container templateLessonComplete(context, text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(text),
        ),
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pop(context);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: const Text("Complete Lesson"))
      ],
    ),
  );
}
