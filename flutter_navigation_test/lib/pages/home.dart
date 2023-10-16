import 'package:flutter/material.dart';
import 'package:flutter_navigation_test/project/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text("Home"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(MyAppRouteConstants.aboutRouteName);
            },
            child: const Text("About Page"),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(MyAppRouteConstants.profileRouteName);
            },
            child: const Text("Profile Page"),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(MyAppRouteConstants.contactUsRouteName);
            },
            child: const Text("Contact Us Page"),
          ),
        ],
      ),
    );
  }
}
