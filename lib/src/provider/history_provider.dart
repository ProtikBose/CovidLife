import 'package:flutter_healthcare_app/src/model/history_model.dart';
import 'package:flutter_healthcare_app/src/services/app_services.dart';
import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  var api = ApiServices();
  HistoryModel history;

  Future<HistoryModel> getHistory() async {
    final response = await api.client.get("${api.historyUrl}");
    if (response.statusCode == 200) {
      notifyListeners();
      var res = historyModelFromJson(response.body);
      history = res;
      return history;
    } else {
      return null;
    }
  }
}
