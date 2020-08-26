import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/yesterday_daily_data.dart';
import 'package:flutter_healthcare_app/src/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class YesterdayDailyProvider with ChangeNotifier {
  var api = ApiServices();
  yesterdayDailyData daily;
  YesterdayDailyProvider() {}

  Future<yesterdayDailyData> getYesterdayDailyProvider() async {
    print("daily provider");
    //String id = getCurrentDate();

    final response = await api.client
        .get("https://disease.sh/v3/covid-19/countries/BGD?yesterday=true");
    print(response.body);
    //print(js["dates"][id]["countries"]["Bangladesh"].toString());

    if (response.statusCode == 200) {
      notifyListeners();
      var res = yesterdayDailyData.fromJson(json.decode(response.body));
      //var res = dailyModelFromJson(json.encode(js["dates"][id]["countries"]["Bangladesh"]), id);
      daily = res;
      //print(daily.runtimeType);
      //print(daily.death.last24);
      //print(daily.recovered.last24);
      //print(daily.recovered.last24);

      return daily;
    } else {
      return null;
      // }
    }
  }
}
