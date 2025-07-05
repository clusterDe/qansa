import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qansa/data/screens/home/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter route = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: HomeScreen.routeName,
  restorationScopeId: HomeScreen.routeName,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
