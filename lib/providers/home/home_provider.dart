import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qansa/routes/routes.dart';
import 'package:qansa/screens/memes_detail/memes_detail_screen.dart';
import '../../models/memes/components/memes.dart';
import '../memes/get_memes_provider.dart';

class HomeProvider extends ChangeNotifier with GetMemesProvider {
  HomeProvider() {
    initHome();
  }

  initHome() async {
    refresh();
  }

  List<Memes> memesData = [];

  refresh() async {
    await getMemes();

    if (dataMemes?.memes != null) {
      memesData = dataMemes!.memes!;
    }
  }

  goToDetail({required Memes data}) {
    var context = navigatorKey.currentState!.context;

    context.pushNamed(MemesDetailScreen.routeName, extra: data);
  }
}
