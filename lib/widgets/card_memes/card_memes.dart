import 'package:flutter/material.dart';

import '../../data/constant.dart';
import '../../models/memes/components/memes.dart';
import '../cache_image/cache_image.dart';

class CardMemes extends StatelessWidget {
  const CardMemes({super.key, this.press, required this.memesData});

  final VoidCallback? press;
  final Memes memesData;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defBorderRadius),
      ),
      child: InkWell(
        onTap: press,
        child: CacheImage(url: '${memesData.url}'),
      ),
    );
  }
}
