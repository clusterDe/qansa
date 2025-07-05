import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/themes/themes_provider.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Consumer<ThemesProvider>(
            builder: (context, themeProv, _) {
              return Switch.adaptive(
                value: themeProv.isDark,
                onChanged: (value) {
                  themeProv.changeTheme();
                },
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                  if (themeProv.isDark) {
                    return const Icon(Icons.dark_mode_outlined);
                  } else {
                    return const Icon(Icons.light_mode_outlined);
                  }
                }),
              );
            },
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
