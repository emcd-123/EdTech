import 'package:flutter/material.dart';
import 'package:flutter_navigation_test/project/routes/app_route_config.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // routeInformationProvider: MyAppRouter().router.routeInformationProvider,
      // routeInformationParser: MyAppRouter().router.routeInformationParser,
      // routerDelegate: MyAppRouter().router.routerDelegate,
      routerConfig: MyAppRouter().router,
    );
  }
}
