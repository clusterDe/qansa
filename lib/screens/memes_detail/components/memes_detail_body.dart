import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qansa/data/constant.dart';
import 'package:qansa/providers/memes_detail/memes_detail_provider.dart';
import 'add_text_section.dart';
import 'image_section.dart';

class MemesDetailBody extends StatefulWidget {
  const MemesDetailBody({super.key});

  @override
  State<MemesDetailBody> createState() => _MemesDetailBodyState();
}

class _MemesDetailBodyState extends State<MemesDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemesDetailProvider>(
      builder: (context, memesDetailProv, _) {
        var dataMemes = memesDetailProv.dataMemes;

        if (dataMemes != null) {
          return Form(
            key: memesDetailProv.formKey,
            child: ListView(
              padding: EdgeInsets.all(defPadding),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: defPadding,
                  children: [
                    ImageSection(),
                    Text(
                      dataMemes.name ?? '-',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AddTextSection(),
                  ],
                ),
                Column(
                  spacing: defPadding / 2,
                  children: List.generate(
                    memesDetailProv.textCtrl.length,
                    (index) => Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: memesDetailProv.textCtrl[index],
                            decoration: InputDecoration(
                              hintText: 'Text $index',
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {
                            memesDetailProv.settingText(index: index);
                          },
                          icon: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: defPadding / 2),
                Builder(
                  builder: (context) {
                    if (memesDetailProv.reset) {
                      return OutlinedButton(
                        onPressed: () {
                          memesDetailProv.resetEdit();
                        },
                        child: Text('Reset'),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: defPadding / 2),
                ElevatedButton(
                  onPressed: () {
                    memesDetailProv.saveToDevice();
                  },
                  child: Text('Save Image'),
                ),
              ],
            ),
          );
        } else {
          return Center(child: Text('Empty'));
        }
      },
    );
  }
}
