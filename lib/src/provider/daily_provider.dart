import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class DailyProvider with ChangeNotifier {
  var api = ApiServices();
  DailyData daily;

  String getyesterday() {
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(yesterday);
    return updatedDt;
  }

  String getCurrentDate() {
    var dt = DateTime.now();
    var newFormat = DateFormat("yyyy-MM-dd");
    String updatedDt = newFormat.format(dt);
    return updatedDt;
  }

  Future<DailyData> getDailyProvider() async {
    print("daily provider");
    //String id = getCurrentDate();

    final response =
        await api.client.get("https://corona-bd.herokuapp.com/stats");
    print(response.body);
    //print(js["dates"][id]["countries"]["Bangladesh"].toString());

    if (response.statusCode == 200) {
      notifyListeners();
      var res = DailyData.fromJson(json.decode(response.body));
      //var res = dailyModelFromJson(json.encode(js["dates"][id]["countries"]["Bangladesh"]), id);
      daily = res;
      //print(daily.runtimeType);
      print(daily.death.last24);
      print(daily.recovered.last24);
      print(daily.recovered.last24);

      return daily;
    } else {
      return null;
      // }
    }
  }
}
