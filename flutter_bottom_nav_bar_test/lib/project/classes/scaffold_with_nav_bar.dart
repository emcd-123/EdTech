import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "Learn"),
            BottomNavigationBarItem(
                icon: Icon(Icons.extension), label: "Practice"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat")
          ],
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context)),
    );
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
