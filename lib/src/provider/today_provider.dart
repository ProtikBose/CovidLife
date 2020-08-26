import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/today_daily_corona_data.dart';
import 'package:flutter_healthcare_app/src/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class TodayDailyProvider with ChangeNotifier {
  var api = ApiServices();
  todayDailyData daily;
  TodayDailyProvider() {}

  Future<todayDailyData> getTodayDailyProvider() async {
    print("today daily provider");
    //String id = getCurrentDate();

    final response =
        await api.client.get("https://disease.sh/v3/covid-19/countries/BGD");
    print(response.body);
    //print(js["dates"][id]["countries"]["Bangladesh"].toString());

    if (response.statusCode == 200) {
      notifyListeners();
      var res = todayDailyData.fromJson(json.decode(response.body));
      //var res = dailyModelFromJson(json.encode(js["dates"][id]["countries"]["Bangladesh"]), id);
      daily = res;
      //print(daily.runtimeType);
      print(daily.todayDeaths);
      print(daily.todayRecovered);
      print(daily.todayCases);

      return daily;
    } else {
      return null;
      // }
    }
  }
}
