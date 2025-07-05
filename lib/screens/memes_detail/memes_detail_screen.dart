import 'package:flutter/material.dart';

import 'components/memes_detail_body.dart';

class MemesDetailScreen extends StatelessWidget {
  static const String routeName = '/memes-detail';
  const MemesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memes Detail'), centerTitle: true),
      body: MemesDetailBody(),
    );
  }
}
