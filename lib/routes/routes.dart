import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/memes/components/memes.dart';
import '../providers/memes_detail/memes_detail_provider.dart';
import '../screens/home/home_screen.dart';
import '../screens/memes_detail/memes_detail_screen.dart';

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
    GoRoute(
      path: MemesDetailScreen.routeName,
      name: MemesDetailScreen.routeName,
      builder: (context, state) => ChangeNotifierProvider.value(
        value: MemesDetailProvider(data: state.extra as Memes),
        child: MemesDetailScreen(),
      ),
    ),
  ],
);
