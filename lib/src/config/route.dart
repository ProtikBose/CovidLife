import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/detail_corona/dashboard.dart';
import 'package:flutter_healthcare_app/src/pages/home_page.dart';
import 'package:flutter_healthcare_app/src/pages/info.dart';
import 'package:flutter_healthcare_app/src/pages/medical/medical_detail.dart';
import 'package:flutter_healthcare_app/src/pages/medical/medical_list.dart';
import 'package:flutter_healthcare_app/src/pages/rumor/rumour_list.dart';
import 'package:flutter_healthcare_app/src/pages/splash_page.dart';
import 'package:flutter_healthcare_app/src/pages/tips/tips_list.dart';
import 'package:flutter_healthcare_app/src/widgets/coustom_route.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      //'/': (_) => SplashPage(),
      '/': (_) {
        return SplashPage();
      },

      //'/HomePage': (_) => HomePage(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      /*
      case "/":
        return CustomRoute<bool>(
            builder: (BuildContext context) => SplashPage());
      */
      case "HomePage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => HomePage(
                  dis: settings.arguments,
                ));

      case "MedicalDetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => MedicalListPage());
      case "TipsDetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => TipsListPage());
      case "RumorsDetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => RumorsListPage());
      case "HospitalDetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => HospitalDetailPage(
                  model: settings.arguments,
                ));
      case "DashboardDetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => DashboardDetailPage(
                  map: settings.arguments,
                ));
      case "InfoPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => ProfileAppPage());
    }
  }
}
