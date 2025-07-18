import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../domain.dart';

//BOTTOM ROUTES
GoRoute riddlesGameRoute = GoRoute(
  path: RoutesPaths.riddlesGame,
  name: RoutesNames.riddlesGame,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: RiddlesGamePage(),
    );
  },
);

GoRoute leaderBoardRoute = GoRoute(
  path: RoutesPaths.leaderBoard,
  name: RoutesNames.leaderBoard,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: LeaderBoardPage(),
    );
  },
);

//MENUS ROUTES
GoRoute dayTaleRoute = GoRoute(
  path: RoutesPaths.dayTale,
  name: RoutesNames.dayTale,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: DayTalePage(),
    );
  },
);

GoRoute talesRoute = GoRoute(
  path: RoutesPaths.tales,
  name: RoutesNames.tales,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: TalesPage(),
    );
  },
  routes: [taleDetailsRoute],
);

GoRoute taleDetailsRoute = GoRoute(
  path: RoutesPaths.taleDetails,
  name: RoutesNames.taleDetails,
  pageBuilder: (context, state) {
    final selectedTale = state.extra as TaleModel;
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: TaleDetails(selectedTale: selectedTale),
    );
  },
);

GoRoute riddlesRoute = GoRoute(
  path: RoutesPaths.riddles,
  name: RoutesNames.riddles,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: RiddlesPage(),
    );
  },
);

GoRoute settingsRoute = GoRoute(
  path: RoutesPaths.settings,
  name: RoutesNames.settings,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: SettingsPage(),
    );
  },
  routes: [aboutRoute],
);

GoRoute aboutRoute = GoRoute(
  path: RoutesPaths.about,
  name: RoutesNames.about,
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutExpo).animate(animation),
          child: child,
        );
      },
      child: AboutPage(),
    );
  },
);

//MAIN ROUTES
GoRoute welcomeRoute = GoRoute(
  path: RoutesPaths.welcome,
  name: RoutesNames.welcome,
  builder: (context, state) {
    return const WelcomePage();
  },
);

GoRoute homeRoute = GoRoute(
  path: RoutesPaths.home,
  name: RoutesNames.home,
  builder: (context, state) {
    final currentUser = Provider.of<GeneralProvider>(
      context,
      listen: false,
    ).currentUser;
    return HomePage(userName: currentUser.name);
  },
  routes: [
    dayTaleRoute,
    talesRoute,
    riddlesRoute,
    settingsRoute,
    riddlesGameRoute,
    leaderBoardRoute,
  ],
);

GoRouter goRouter = GoRouter(
  errorBuilder: (context, state) {
    return ErrorPage();
  },
  initialLocation: RoutesPaths.home,
  redirect: (context, state) async {
    if (context.read<GeneralProvider>().currentUser.id.isEmpty ||
        FirebaseAuth.instance.currentUser == null) {
      return RoutesPaths.welcome;
    }
    return null;
  },
  routes: [welcomeRoute, homeRoute],
);
