
import 'package:chatgpt_bot/models/model.dart';
import 'package:flutter/cupertino.dart';

import '../services/api_services.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "gpt-3.5-turbo";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelModels> modelsList = [];

  List<ModelModels> get getModelsList {
    return modelsList;
  }

  Future<List<ModelModels>> getAllModels() async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}