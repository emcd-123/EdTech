import 'package:flutter_bottom_nav_bar_test/pages/chat.dart';
import 'package:flutter_bottom_nav_bar_test/pages/learn.dart';
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
          builder: (context, state, child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/learn',
              builder: (context, state) {
                return const LearnScreen();
              },
              // routes: <RouteBase>[
              //   GoRoute(
              //       path: 'practice',
              //       builder: (context, state) {
              //         return const PracticeScreen();
              //       })
              // ]
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
          ])
    ],
  );
}
