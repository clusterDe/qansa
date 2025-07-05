import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qansa/data/constant.dart';
import 'package:qansa/data/helpers/custom_snackbar/custom_snackbar.dart';
import 'package:qansa/routes/routes.dart';
import '../../models/memes/components/memes.dart';

class MemesDetailProvider extends ChangeNotifier {
  MemesDetailProvider({Memes? data}) {
    saveDataMemes(data);
  }

  Memes? dataMemes;

  saveDataMemes(Memes? data) {
    dataMemes = data;
    notifyListeners();
  }

  bool reset = false;

  int textCount = 0;

  final GlobalKey previewKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextEditingController> textCtrl = [];
  List<Offset> textPositions = [];
  List<double> fontSize = [];
  List<Color> fontColor = [];
  List<Color> fontBg = [];
  List<double> textAngle = [];

  addText() {
    textCount++;
    textCtrl.add(TextEditingController());
    textPositions.add(Offset(0, 0));
    fontSize.add(16);
    fontColor.add(Colors.white);
    fontBg.add(Colors.black);
    textAngle.add(0.0);
    reset = !reset;
    notifyListeners();
  }

  updateTextPosition({required DragUpdateDetails details, required int index}) {
    var newX = textPositions[index].dx + details.delta.dx;
    var newY = textPositions[index].dy + details.delta.dy;

    newX = newX.clamp(0.0, dataMemes!.width!.toDouble());
    newY = newY.clamp(0.0, dataMemes!.height!.toDouble());

    textPositions[index] = Offset(newX, newY);
    notifyListeners();
  }

  resetEdit() {
    reset = !reset;
    textCtrl.clear();
    textPositions.clear();
    notifyListeners();
  }

  settingText({required int index}) async {
    var context = navigatorKey.currentState!.context;
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
                return Padding(
                  padding: EdgeInsets.all(defPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Transform.rotate(
                          angle: textAngle[index],
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: defPadding / 4,
                            ),
                            child: Text(
                              textCtrl[index].text,
                              style: TextStyle(
                                fontSize: fontSize[index],
                                color: fontColor[index],
                                backgroundColor: fontBg[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: defPadding),
                      Text(
                        'Font Size',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: defPadding / 2),
                      Slider.adaptive(
                        min: 10,
                        max: 50,
                        divisions: 40,
                        value: fontSize[index],
                        label: fontSize[index].toStringAsFixed(0),
                        onChanged: (value) {
                          fontSize[index] = value;
                          notifyListeners();

                          setState(() {});
                        },
                      ),
                      SizedBox(height: defPadding),
                      Text(
                        'Text Rotation',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: defPadding / 2),
                      Slider.adaptive(
                        min: 0,
                        max: 360,
                        divisions: 360,
                        value: textAngle[index] * (180 / pi),
                        label: textAngle[index].toStringAsFixed(0),
                        onChanged: (value) {
                          textAngle[index] = value * (pi / 180);
                          notifyListeners();

                          setState(() {});
                        },
                      ),
                      SizedBox(height: defPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Font Color',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              var color = await showColorPickerDialog(
                                context,
                                fontColor[index],
                                colorCodeHasColor: true,
                                pickersEnabled: <ColorPickerType, bool>{
                                  ColorPickerType.wheel: true,
                                },
                              );
                              fontColor[index] = color;
                              notifyListeners();

                              setState(() {});
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              padding: EdgeInsets.all(defPadding / 8),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: fontColor[index],
                                borderRadius: BorderRadius.circular(
                                  defBorderRadius,
                                ),
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: defPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Font Color Background',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              var color = await showColorPickerDialog(
                                context,
                                fontColor[index],
                                colorCodeHasColor: true,
                                pickersEnabled: <ColorPickerType, bool>{
                                  ColorPickerType.wheel: true,
                                },
                              );
                              fontBg[index] = color;
                              notifyListeners();

                              setState(() {});
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              padding: EdgeInsets.all(defPadding / 8),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: fontBg[index],
                                borderRadius: BorderRadius.circular(
                                  defBorderRadius,
                                ),
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: defPadding * 1.5),
                    ],
                  ),
                );
              },
        );
      },
    );
  }

  Future<void> saveToDevice() async {
    try {
      String? selectedPath;

      if (Platform.isAndroid) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          var context = navigatorKey.currentState!.context;
          if (!context.mounted) return;
          CsnackBar.show(context, content: 'Permission denied');
          return;
        }

        selectedPath = await FilePicker.platform.getDirectoryPath();

        if (selectedPath == null) {
          return;
        }
      }

      if (Platform.isIOS) {
        selectedPath = await FilePicker.platform.getDirectoryPath();
        if (selectedPath == null) {
          return;
        }

        // final dir = await getApplicationDocumentsDirectory();
        // selectedPath = dir.path;
      }

      RenderRepaintBoundary boundary =
          previewKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      var fileFormat = dataMemes?.url?.split('.').last;

      final fileName =
          '${dataMemes?.name}_${DateTime.now().millisecondsSinceEpoch}.$fileFormat';
      final file = File('$selectedPath/$fileName');
      await file.writeAsBytes(pngBytes);

      var context = navigatorKey.currentState!.context;
      if (!context.mounted) return;
      CsnackBar.show(context, content: 'Success save to $selectedPath');
    } catch (e) {
      var context = navigatorKey.currentState!.context;
      if (!context.mounted) return;
      CsnackBar.show(context, content: 'Failed save image');
    }
  }
}
