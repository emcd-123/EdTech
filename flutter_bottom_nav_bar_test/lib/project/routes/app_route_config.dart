import 'package:flutter_bottom_nav_bar_test/pages/chat.dart';
import 'package:flutter_bottom_nav_bar_test/pages/learn.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/0_what_is_keigo.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/11_motte.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/12_miru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/13_iu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/14_omou.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/15_kiku.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/16_shitteiru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/17_yomu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/18_ageru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/19_kiru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/20_au.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/21_sumu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/22_neru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/23_shinu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/24_nado.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/25_meishi.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/26_jin.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/27_toshi.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/28_sama.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/29_ikaga.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/30_dochira.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/31_shoushou.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/32_asu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/33_mamonaku.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/34_kono_aida.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/35_sakujitsu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/36_sakihodo.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/37_totemo.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/38_summary.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/3_levels_of_respect.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/4_copula.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/5_taberu_nomu.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/6_iru_teiru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/7_suru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/8_iku.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/9_kuru.dart';
import 'package:flutter_bottom_nav_bar_test/pages/lessons/10_ingroups_outgroups.dart';
import 'package:flutter_bottom_nav_bar_test/pages/practice.dart';
import 'package:flutter_bottom_nav_bar_test/project/classes/scaffold_with_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar_test/main.dart';

import '../../pages/lessons/1_why_learn_keigo.dart';
import '../../pages/lessons/2_when_to_use.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "shell");

CustomTransitionPage buildPageWithoutAnimation(
    {required BuildContext context,
    required GoRouterState state,
    required Widget child}) {
  return CustomTransitionPage(
      child: child,
      transitionsBuilder: ((context, animation, secondaryAnimation, child) =>
          child));
}

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
              pageBuilder: (context, state) => buildPageWithoutAnimation(
                  context: context, state: state, child: LearnScreen())
              // routes: <RouteBase>[
              //
              // ],
              ),
          GoRoute(
              path: '/practice',
              builder: (context, state) {
                return const PracticeScreen();
              },
              pageBuilder: (context, state) => buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const PracticeScreen())),
          GoRoute(
              path: '/chat',
              builder: (context, state) {
                return const ChatScreen();
              },
              pageBuilder: (context, state) => buildPageWithoutAnimation(
                  context: context, state: state, child: const ChatScreen()))
        ],
      ),
      GoRoute(
        path: '/what_is_keigo',
        builder: (context, state) {
          return const LessonWhatIsKeigo();
        },
      ),
      GoRoute(
        path: '/why_learn_keigo',
        builder: (context, state) {
          return const LessonWhyLearnKeigo();
        },
      ),
      GoRoute(
        path: '/when_to_use',
        builder: (context, state) {
          return const LessonWhenToUse();
        },
      ),
      GoRoute(
        path: '/levels_of_respect',
        builder: (context, state) {
          return const LessonLevelsOfRespect();
        },
      ),
      GoRoute(
        path: '/copula',
        builder: (context, state) {
          return const LessonCopula();
        },
      ),
      GoRoute(
        path: '/taberu_nomu',
        builder: (context, state) {
          return const LessonTaberuNomu();
        },
      ),
      GoRoute(
        path: '/iru',
        builder: (context, state) {
          return const LessonIru();
        },
      ),
      GoRoute(
        path: '/suru',
        builder: (context, state) {
          return const LessonSuru();
        },
      ),
      GoRoute(
        path: '/iku',
        builder: (context, state) {
          return const LessonIku();
        },
      ),
      GoRoute(
        path: '/kuru',
        builder: (context, state) {
          return const LessonKuru();
        },
      ),
      GoRoute(
        path: '/uchi_soto',
        builder: (context, state) {
          return const LessonUchiSoto();
        },
      ),
      GoRoute(
        path: '/motte',
        builder: (context, state) {
          return const LessonMotte();
        },
      ),
      GoRoute(
        path: '/miru',
        builder: (context, state) {
          return const LessonMiru();
        },
      ),
      GoRoute(
        path: '/iu',
        builder: (context, state) {
          return const LessonIu();
        },
      ),
      GoRoute(
        path: '/omou',
        builder: (context, state) {
          return const LessonOmou();
        },
      ),
      GoRoute(
        path: '/kiku',
        builder: (context, state) {
          return const LessonKiku();
        },
      ),
      GoRoute(
        path: '/shitteiru',
        builder: (context, state) {
          return const LessonShitteiru();
        },
      ),
      GoRoute(
        path: '/yomu',
        builder: (context, state) {
          return const LessonYomu();
        },
      ),
      GoRoute(
        path: '/ageru',
        builder: (context, state) {
          return const LessonAgeru();
        },
      ),
      GoRoute(
        path: '/kiru',
        builder: (context, state) {
          return const LessonKiru();
        },
      ),
      GoRoute(
        path: '/au',
        builder: (context, state) {
          return const LessonAu();
        },
      ),
      GoRoute(
        path: '/sumu',
        builder: (context, state) {
          return const LessonSumu();
        },
      ),
      GoRoute(
        path: '/neru',
        builder: (context, state) {
          return const LessonNeru();
        },
      ),
      GoRoute(
        path: '/shinu',
        builder: (context, state) {
          return const LessonShinu();
        },
      ),
      GoRoute(
        path: '/nado',
        builder: (context, state) {
          return const LessonNado();
        },
      ),
      GoRoute(
        path: '/meishi',
        builder: (context, state) {
          return const LessonMeishi();
        },
      ),
      GoRoute(
        path: '/jin',
        builder: (context, state) {
          return const LessonJin();
        },
      ),
      GoRoute(
        path: '/toshi',
        builder: (context, state) {
          return const LessonToshi();
        },
      ),
      GoRoute(
        path: '/sama',
        builder: (context, state) {
          return const LessonSama();
        },
      ),
      GoRoute(
        path: '/ikaga',
        builder: (context, state) {
          return const LessonIkaga();
        },
      ),
      GoRoute(
        path: '/dochira',
        builder: (context, state) {
          return const LessonDochira();
        },
      ),
      GoRoute(
        path: '/shoushou',
        builder: (context, state) {
          return const LessonShoushou();
        },
      ),
      GoRoute(
        path: '/asu',
        builder: (context, state) {
          return const LessonAsu();
        },
      ),
      GoRoute(
        path: '/mamonaku',
        builder: (context, state) {
          return const LessonMamonaku();
        },
      ),
      GoRoute(
        path: '/kono_aida',
        builder: (context, state) {
          return const LessonKonoAida();
        },
      ),
      GoRoute(
        path: '/sakujitsu',
        builder: (context, state) {
          return const LessonSakujitsu();
        },
      ),
      GoRoute(
        path: '/sakihodo',
        builder: (context, state) {
          return const LessonSakihodo();
        },
      ),
      GoRoute(
        path: '/totemo',
        builder: (context, state) {
          return const LessonTotemo();
        },
      ),
      GoRoute(
        path: '/summary',
        builder: (context, state) {
          return const LessonSummary();
        },
      ),
    ],
  );
}
