import 'package:flutter_bottom_nav_bar_test/pages/chat.dart';
import 'package:flutter_bottom_nav_bar_test/pages/learn.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/what_is_keigo.dart';
import 'package:flutter_bottom_nav_bar_test/pages/practice.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/scaffold_with_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/main.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "shell");

class MyShellRouter {
  GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/learn',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        // Turned this from builder to pageBuilder as per advise from https://stackoverflow.com/questions/74957312/calling-firebase-auth-login-or-logout-with-flutter-causes-an-assert-registry-co
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: ScaffoldWithNavBar(child: child));
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/learn',
            builder: (context, state) {
              return LearnScreen();
            },
            // routes: <RouteBase>[
            //
            // ],
          ),
          GoRoute(
              path: '/practice',
              builder: (context, state) {
                return const PracticeScreen();
              }),
          GoRoute(
              path: '/chat',
              builder: (context, state) {
                return const ChatScreen();
              })
        ],
      ),
      GoRoute(
        path: '/what_is_keigo',
        builder: (context, state) {
          return const LessonWhatIsKeigo();
        },
      ),
    ],
  );
}
