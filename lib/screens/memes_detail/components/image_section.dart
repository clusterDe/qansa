import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qansa/data/constant.dart';

import '../../../providers/memes_detail/memes_detail_provider.dart';
import '../../../widgets/cache_image/cache_image.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemesDetailProvider>(
      builder: (context, memesDetailProv, _) {
        var dataMemes = memesDetailProv.dataMemes;

        var textCtrl = memesDetailProv.textCtrl;

        return RepaintBoundary(
          key: memesDetailProv.previewKey,
          child: Stack(
            children: [
              CacheImage(url: '${dataMemes?.url}', fit: BoxFit.contain),
              if (textCtrl.isNotEmpty)
                for (int i = 0; i < memesDetailProv.textCtrl.length; i++)
                  Positioned(
                    left: memesDetailProv.textPositions[i].dx,
                    top: memesDetailProv.textPositions[i].dy,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        memesDetailProv.updateTextPosition(
                          details: details,
                          index: i,
                        );
                      },
                      child: Transform.rotate(
                        angle: memesDetailProv.textAngle[i],
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: defPadding / 4,
                          ),
                          child: Text(
                            memesDetailProv.textCtrl[i].text,
                            style: TextStyle(
                              fontSize: memesDetailProv.fontSize[i],
                              color: memesDetailProv.fontColor[i],
                              backgroundColor: memesDetailProv.fontBg[i],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
