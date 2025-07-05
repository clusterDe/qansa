import 'package:flutter/material.dart';
import 'package:qansa/data/helpers/api/api_helper.dart';
import 'package:qansa/models/memes/memes_model.dart';

import '../../models/memes/components/data_memes.dart';

enum ResultGetMemesState { loading, noData, hasData, error }

mixin GetMemesProvider on ChangeNotifier {
  DataMemes? dataMemes;

  ResultGetMemesState? stateGetMemems;

  String msgGetMemems = '';

  getMemes() async {
    stateGetMemems = ResultGetMemesState.loading;
    notifyListeners();

    try {
      var result = await ApiHelper.apiGetMemes();

      if (result == null) {
        msgGetMemems = 'No data';
        stateGetMemems = ResultGetMemesState.noData;
      } else {
        var memesModel = MemesModel.fromMap(result);

        dataMemes = memesModel.data;
        stateGetMemems = ResultGetMemesState.hasData;
      }
    } catch (e) {
      msgGetMemems = '$e';
      stateGetMemems = ResultGetMemesState.error;
    } finally {
      notifyListeners();
    }
  }
}
