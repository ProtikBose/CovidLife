import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/district_data.dart';
import 'package:flutter_healthcare_app/src/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class DistrictDailyProvider with ChangeNotifier {
  var api = ApiServices();
  DistrictData daily;

  Future<DistrictData> getDailyDistrictProvider() async {
    print("daily provider");
    //String id = getCurrentDate();

    final response =
        await api.client.get("https://corona-bd.herokuapp.com/district");
    print(response.body);
    //print(js["dates"][id]["countries"]["Bangladesh"].toString());

    if (response.statusCode == 200) {
      notifyListeners();
      var res = DistrictData.fromJson(json.decode(response.body));
      //var res = dailyModelFromJson(json.encode(js["dates"][id]["countries"]["Bangladesh"]), id);
      daily = res;
      //print(daily.runtimeType);
      print(daily.data[0].name);

      return daily;
    } else {
      return null;
      // }
    }
  }
}
