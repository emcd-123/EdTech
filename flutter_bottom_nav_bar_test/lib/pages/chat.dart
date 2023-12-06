import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/notifications.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keigo Dojo")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
                "Chat Screen: Currently using to test notifications and sqlite database"),
            ElevatedButton(
              onPressed: () async {
                await NotificationService.showNotification(
                    title: "Time to Practice!",
                    body: "Click here to improve your Japanese");
              },
              child: const Text("Using this to test notification sending"),
            ),
            ElevatedButton(
              onPressed: () async {
                await NotificationService.showNotification(
                    title: "Scheduled notification",
                    body: "This notification should arrive at about 5:30",
                    scheduled: true,
                    interval: 10800);
              },
              child: const Text("Test out a scheduled notification"),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push("/database");
              },
              child: const Text("Open Database View Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
