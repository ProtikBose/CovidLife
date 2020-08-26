import 'package:flutter_healthcare_app/src/model/country_model.dart';
import 'package:flutter_healthcare_app/src/services/app_services.dart';
import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  var api = ApiServices();
  CountryModel country;

  Future<CountryModel> getCountryProvider() async {
    final response = await api.client.get("${api.baseUrl}/api/countries/");
    if (response.statusCode == 200) {
      notifyListeners();
      var res = countryModelFromJson(response.body);
      country = res;
      return country;
    } else {
      return null;
    }
  }
}
