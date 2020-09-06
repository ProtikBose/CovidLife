import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/today_daily_corona_data.dart';
import 'package:flutter_healthcare_app/src/model/two_days_ago_model.dart';
import 'package:flutter_healthcare_app/src/model/yesterday_daily_data.dart';
import "package:intl/intl.dart";

class DetailsboardGlobal extends StatefulWidget {
  final yesterdayDailyData yesd;
  final TwoDaysAgoDailyData tdagod;
  final todayDailyData dailyd;
  @override
  DetailsboardGlobal({this.dailyd, this.yesd, this.tdagod});

  _DetailsboardGlobalState createState() {
    return _DetailsboardGlobalState();
  }
}

class _DetailsboardGlobalState extends State<DetailsboardGlobal> {
  todayDailyData dailyd;
  yesterdayDailyData yesd;
  TwoDaysAgoDailyData tdagod;

  String date;
  int infected, death, recovered;
  int intdate;

  int totaltestDoneToday;
  int totaltestDoneYesterday;
  int totaltestDone;

  int totalInfected;
  int totaldeaths;
  int totalRecovered;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  double testsPerOneMillion;
  double oneCasePerPeople;
  double oneDeathPerPeople;
  double oneTestPerPeople;
  double recoveredPerOneMillion;
  int population;

  @override
  void initState() {
    dailyd = widget.dailyd;
    yesd = widget.yesd;
    tdagod = widget.tdagod;

    if (dailyd.todayCases == 0 &&
        dailyd.todayDeaths == 0 &&
        dailyd.todayRecovered == 0) {
      infected = yesd.todayCases;
      death = yesd.todayDeaths;
      recovered = yesd.todayRecovered;
      intdate = yesd.updated;
      DateTime ddate = new DateTime.fromMillisecondsSinceEpoch(intdate);
      var format = new DateFormat("EEE, MMM d, yyyy");
      date = format.format(ddate);
      totaltestDoneToday = yesd.tests;
      totaltestDoneYesterday = tdagod.tests;
      totaltestDone = totaltestDoneToday - totaltestDoneYesterday;

      totalInfected = yesd.cases;
      totaldeaths = yesd.deaths;
      totalRecovered = yesd.recovered;
      casesPerOneMillion = yesd.casesPerOneMillion.toDouble();
      deathsPerOneMillion = yesd.deathsPerOneMillion.toDouble();
      testsPerOneMillion = yesd.testsPerOneMillion.toDouble();
      oneCasePerPeople = yesd.oneCasePerPeople.toDouble();
      oneDeathPerPeople = yesd.oneDeathPerPeople.toDouble();
      oneTestPerPeople = yesd.oneTestPerPeople.toDouble();
      recoveredPerOneMillion = yesd.recoveredPerOneMillion.toDouble();
      population = yesd.population;
    } else {
      infected = dailyd.todayCases;
      death = dailyd.todayDeaths;
      recovered = dailyd.todayRecovered;
      intdate = dailyd.updated;
      DateTime ddate = new DateTime.fromMillisecondsSinceEpoch(intdate);
      var format = new DateFormat("EEE, MMM d, yyyy");
      date = format.format(ddate);
      totaltestDoneToday = dailyd.tests;
      totaltestDoneYesterday = yesd.tests;
      totaltestDone = totaltestDoneToday - totaltestDoneYesterday;

      totalInfected = dailyd.cases;
      totaldeaths = dailyd.deaths;
      totalRecovered = dailyd.recovered;
      casesPerOneMillion = dailyd.casesPerOneMillion.toDouble();
      deathsPerOneMillion = dailyd.deathsPerOneMillion.toDouble();
      testsPerOneMillion = dailyd.testsPerOneMillion.toDouble();
      oneCasePerPeople = dailyd.oneCasePerPeople.toDouble();
      oneDeathPerPeople = dailyd.oneDeathPerPeople.toDouble();
      oneTestPerPeople = dailyd.oneTestPerPeople.toDouble();
      recoveredPerOneMillion = dailyd.recoveredPerOneMillion.toDouble();
      population = dailyd.population;
    }
    super.initState();
  }

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  Widget _buildTotalCountWidget(BuildContext context) {
    //final CoronaTotalCount totalCount = snapshot.data;
    /*
        final data = [
          LinearCases(CaseType.sick.index, totalCount.sick,
              totalCount.sickRate.toInt(), "Sick"),
          LinearCases(CaseType.deaths.index, totalCount.deaths,
              totalCount.fatalityRate.toInt(), "Deaths"),
          LinearCases(CaseType.recovered.index, totalCount.recovered,
              totalCount.recoveryRate.toInt(), "Recovered")
        ];
        */
    final data = [
      LinearCases(1, infected, totalInfected, "আক্রান্ত"),
      LinearCases(2, death, totaldeaths, "মৃত্যু"),
      LinearCases(3, recovered, totalRecovered, "সুস্থ"),
    ];
    final series = [
      charts.Series<LinearCases, int>(
        id: 'Total Count',
        domainFn: (LinearCases cases, _) => cases.type,
        measureFn: (LinearCases cases, _) => cases.count,
        labelAccessorFn: (LinearCases cases, _) =>
            '${cases.text}\n${NumberFormat().format(cases.count)}',
        colorFn: (cases, index) {
          switch (cases.text) {
            case "মৃত্যু":
              return charts.ColorUtil.fromDartColor(Colors.red);
            case "আক্রান্ত":
              return charts.ColorUtil.fromDartColor(Colors.orangeAccent);
            case "সুস্থ":
              return charts.ColorUtil.fromDartColor(Colors.green);
            default:
              return charts.ColorUtil.fromDartColor(Colors.red);
          }
        },
        data: data,
      )
    ];

    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("সর্বশেষ আপডেট : " + date),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
              ),
              Text(
                "গত ২৪ ঘন্টায় সারাদেশের তথ্য",
                style: Theme.of(context).textTheme.headline,
              ),
              Container(
                  height: 200,
                  child: charts.PieChart(
                    series,
                    animate: true,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcWidth: 60,
                        arcRendererDecorators: [charts.ArcLabelDecorator()]),
                  )),
              SizedBox(
                height: 40,
              ),
              Container(
                  child: new GridView.count(
                crossAxisCount: 2,
                childAspectRatio: ((MediaQuery.of(context).size.width / 4) /
                    (MediaQuery.of(context).size.height / 20)),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        totaltestDone.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.blue),
                      ),
                      Text("নমুনা পরীক্ষা")
                    ],
                  )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        infected.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.orange),
                      ),
                      Text("আক্রান্ত সংখ্যা")
                    ],
                  )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        recovered.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.green),
                      ),
                      Text("সুস্থ")
                    ],
                  )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        roundDouble((totalRecovered / totalInfected) * 100, 2)
                                .toString() +
                            "%",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.green),
                      ),
                      Text("শনাক্তের বিচারে সুস্থতার হার")
                    ],
                  )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        death.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.red),
                      ),
                      Text("মৃত")
                    ],
                  )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        roundDouble((totaldeaths / totalInfected) * 100, 2)
                                .toString() +
                            "%",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.red),
                      ),
                      Text("শনাক্তের বিচারে\nমৃত্যুহার")
                    ],
                  ))
                ],
              ))
            ]));
  }

  Widget _buildAllCasesWidget(BuildContext context) {
    //final List<CoronaCaseCountry> cases = snapshot.data;
    var children = List<Widget>();

    final data = [
      OrdinalCases(
        "আক্রান্ত",
        totalInfected,
      ),
      OrdinalCases("সুস্থ", totalRecovered),
      OrdinalCases("মৃত", totaldeaths),
    ];

    final seriesList = [
      charts.Series<OrdinalCases, String>(
        id: 'BD Cases',
        domainFn: (OrdinalCases cases, _) => cases.country,
        measureFn: (OrdinalCases cases, _) => cases.total,
        data: data,
        labelAccessorFn: (OrdinalCases cases, _) {
          return '${NumberFormat().format(cases.total)}';
        },
        colorFn: (cases, index) {
          switch (cases.country) {
            case 'আক্রান্ত':
              return charts.ColorUtil.fromDartColor(Colors.blue);
            case 'সুস্থ':
              return charts.ColorUtil.fromDartColor(Colors.green);
            default:
              return charts.ColorUtil.fromDartColor(Colors.red);
          }
        },
      )
    ];

    children.addAll([
      Padding(
        padding: EdgeInsets.only(top: 6),
      ),
      Text(
        "এখন পর্যন্ত করোনা পরিসংখ্যান",
        style: Theme.of(context).textTheme.headline,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
      ),
      Container(
          height: totalInfected / MediaQuery.of(context).size.height,
          child: charts.BarChart(
            seriesList,
            animate: true,
            barRendererDecorator: new charts.BarLabelDecorator<String>(),
            domainAxis: new charts.OrdinalAxisSpec(),
          )),
      Padding(
        padding: EdgeInsets.only(bottom: 16),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
          child: new GridView.count(
        crossAxisCount: 2,
        childAspectRatio: ((MediaQuery.of(context).size.width / 4) /
            (MediaQuery.of(context).size.height / 20)),
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                totaltestDoneToday.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.blue),
              ),
              Text("মোট নমুনা পরীক্ষা")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                totalInfected.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.orange),
              ),
              Text("মোট আক্রান্ত সংখ্যা")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                totalRecovered.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.green),
              ),
              Text("মোট সুস্থ")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                totaldeaths.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.red),
              ),
              Text("মোট মৃতের সংখ্যা")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                oneTestPerPeople.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.blue),
              ),
              Text("লোক প্রতি নমুনা সংখ্যা")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                oneCasePerPeople.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.orange),
              ),
              Text("লোক প্রতি আক্রান্ত সংখ্যা")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                oneDeathPerPeople.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.red),
              ),
              Text("লোক প্রতি মৃতের সংখ্যা")
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                roundDouble((population / 10000000), 3).toString() + " কোটি",
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(color: Colors.brown),
              ),
              Text("বর্তমান জনসংখ্যা")
            ],
          )),
        ],
      )),
      Divider(),
    ]);

    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 26),
            child: Container(
                constraints: BoxConstraints(maxWidth: 768),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      _buildTotalCountWidget(context),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Divider(),
                      ),
                      _buildAllCasesWidget(context)
                    ],
                  ),
                ))));
  }
}

enum CaseType { confirmed, deaths, recovered, sick }

class LinearCases {
  final int type;
  final int count;
  final int total;
  final String text;

  LinearCases(this.type, this.count, this.total, this.text);
}

class OrdinalCases {
  final String country;
  final int total;
  //final CoronaTotalCount totalCount;

  OrdinalCases(this.country, this.total);
}
