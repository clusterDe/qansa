import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qansa/providers/home/home_provider.dart';
import 'package:qansa/providers/themes/themes_provider.dart';

import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      builder: (context, child) {
        return Consumer2<ThemesProvider, HomeProvider>(
          builder: (context, themeProv, homeProv, _) {
            return MaterialApp.router(
              title: 'Qansa',
              debugShowCheckedModeBanner: false,
              theme: themeProv.themeData,
              routerDelegate: route.routerDelegate,
              routeInformationParser: route.routeInformationParser,
              routeInformationProvider: route.routeInformationProvider,
            );
          },
        );
      },
    );
  }
}
