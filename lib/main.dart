import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/provider/district_provider.dart';
import 'package:flutter_healthcare_app/src/provider/two_days_ago_provider.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/provider/country_provider.dart';
import 'package:flutter_healthcare_app/src/provider/daily_provider.dart';
import 'package:flutter_healthcare_app/src/provider/today_provider.dart';
import 'package:flutter_healthcare_app/src/provider/yesterday_provider.dart';
import 'package:flutter_healthcare_app/src/provider/history_provider.dart';

//import 'package:covid19/providers/home_provider.dart';
//import 'package:covid19/providers/province_provider.dart';
//import 'package:covid19/screens/home_page.dart';
//import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      //ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => DailyProvider()),
      ChangeNotifierProvider(create: (_) => TodayDailyProvider()),
      ChangeNotifierProvider(create: (_) => YesterdayDailyProvider()),
      ChangeNotifierProvider(create: (_) => DistrictDailyProvider()),
      ChangeNotifierProvider(create: (_) => TwoDaysAgoDailyProvider()),
      //ChangeNotifierProvider(create: (_) => ProvinceProvider()),
      //ChangeNotifierProvider(create: (_) => CountryProvider()),
      //ChangeNotifierProvider(create: (_) => HistoryProvider()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovidLife',
      theme: AppTheme.lightTheme,
      routes: Routes.getRoute(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashPage",
    );
  }
}
