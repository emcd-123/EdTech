import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/providers.dart';
import 'package:flutter_bottom_nav_bar_test/project/routes/app_route_config.dart';
import 'package:provider/provider.dart';

import 'project/classes/notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScoreKeeperProvider()),
        ChangeNotifierProvider(create: (context) => MyPracticeReviewsProvider())
      ],
      child: MaterialApp.router(
        title: "Keigo Dojo",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: MyShellRouter().router,
      ),
    );
  }
}
