import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/memes_detail/memes_detail_provider.dart';

class AddTextSection extends StatelessWidget {
  const AddTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemesDetailProvider>(
      builder: (context, memesDetailProv, _) {
        if (memesDetailProv.textCount < memesDetailProv.dataMemes!.boxCount!) {
          return ElevatedButton.icon(
            onPressed: () {
              memesDetailProv.addText();
            },
            label: Text('Add Text'),
            icon: Icon(Icons.add),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
