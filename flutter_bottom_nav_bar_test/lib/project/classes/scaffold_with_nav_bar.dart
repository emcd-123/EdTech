import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/database_classes.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.child, super.key});

  final Widget child;
  final bool debugMode = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseHelper.instance.getReviewsDue(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          int reviewsNum;
          if (snapshot.data == null) {
            reviewsNum = 0;
          } else {
            reviewsNum = snapshot.data.length;
          }

          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
                elevation: 20,
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.school), label: "Learn"),
                  BottomNavigationBarItem(
                      icon: badges.Badge(
                        badgeContent: Text(
                          reviewsNum.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        // badgeStyle: badges.BadgeStyle(),
                        showBadge: reviewsNum != 0,
                        child: const Icon(Icons.extension),
                      ),
                      label: "Practice"),
                  if (debugMode)
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Debug")
                ],
                currentIndex: _calculateSelectedIndex(context),
                onTap: (int idx) => _onItemTapped(idx, context)),
          );
        });
  }

  static int _calculateSelectedIndex(context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/learn')) {
      return 0;
    }
    if (location.startsWith('/practice')) {
      return 1;
    }
    if (location.startsWith('/chat')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/learn');
        break;
      case 1:
        GoRouter.of(context).go('/practice');
        break;
      case 2:
        GoRouter.of(context).go('/chat');
        break;
    }
  }
}
