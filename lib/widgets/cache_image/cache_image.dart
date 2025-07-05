import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    this.url,
    this.errorImage,
    this.fit,
    this.color,
    this.scale,
  });

  final String? url;
  final Widget? errorImage;
  final BoxFit? fit;
  final Color? color;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$url',
      color: color,
      colorBlendMode: BlendMode.multiply,
      scale: scale ?? 1,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            value: downloadProgress.progress,
          ),
        );
      },
      errorWidget: (context, url, error) {
        if (errorImage != null) {
          return errorImage!;
        } else {
          return const Icon(Icons.error_outline);
        }
      },
      errorListener: (value) {},
      fit: fit ?? BoxFit.cover,
    );
  }
}
