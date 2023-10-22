import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keigo Dojo"),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Practice Screen"),
          ],
        ),
      ),
    );
  }
}
