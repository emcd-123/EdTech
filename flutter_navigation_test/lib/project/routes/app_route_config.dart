import 'package:flutter_navigation_test/pages/about.dart';
import 'package:flutter_navigation_test/pages/contact_us.dart';
import 'package:flutter_navigation_test/pages/error_page.dart';
import 'package:flutter_navigation_test/pages/home.dart';
import 'package:flutter_navigation_test/pages/profile.dart';
import 'package:flutter_navigation_test/project/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Home());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.profileRouteName,
          path: '/profile',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Profile());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.aboutRouteName,
          path: '/about',
          pageBuilder: (context, state) {
            return const MaterialPage(child: About());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.contactUsRouteName,
          path: '/contactus',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ContactUS());
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      });
}
