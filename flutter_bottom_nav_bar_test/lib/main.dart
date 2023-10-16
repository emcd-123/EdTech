import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/routes/app_route_config.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Keigo Dojo",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: MyShellRouter().router,
    );
  }
}
