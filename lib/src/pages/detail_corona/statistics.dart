import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import "package:intl/intl.dart";

class DetailsboardGlobal extends StatefulWidget {
  @override
  _DetailsboardGlobalState createState() {
    return _DetailsboardGlobalState();
  }
}

class _DetailsboardGlobalState extends State<DetailsboardGlobal> {
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
      LinearCases(1, 10, 2500, "Sick"),
      LinearCases(2, 10, 54, "Deaths"),
      LinearCases(3, 10, 4000, "Recovered")
    ];
    final series = [
      charts.Series<LinearCases, int>(
        id: 'Total Count',
        domainFn: (LinearCases cases, _) => cases.type,
        measureFn: (LinearCases cases, _) => cases.total,
        labelAccessorFn: (LinearCases cases, _) =>
            '${cases.text}\n${NumberFormat().format(cases.count)}',
        colorFn: (cases, index) {
          switch (cases.text) {
            case "Confirmed":
              return charts.ColorUtil.fromDartColor(Colors.blue);
            case "Sick":
              return charts.ColorUtil.fromDartColor(Colors.orangeAccent);
            case "Recovered":
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
              Text("Last updated: "),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
              ),
              Text(
                "Global Total Cases Stats",
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
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "100",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.blue),
                          ),
                          Text("Confirmed")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "10",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.orange),
                          ),
                          Text("Sick")
                        ],
                      )
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "30",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.green),
                            ),
                            Text("Recovered")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "30",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.green),
                            ),
                            Text("Recovery Rate")
                          ],
                        )
                      ])),
              Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "40",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.red),
                            ),
                            Text("Deaths")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "50",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.red),
                            ),
                            Text("Fatality Rate")
                          ],
                        )
                      ])),
            ]));
  }

  Widget _buildAllCasesWidget(BuildContext context) {
    //final List<CoronaCaseCountry> cases = snapshot.data;
    var children = List<Widget>();

    final data = [
      OrdinalCases(
        "Confirmed",
        2500,
      ),
      OrdinalCases("Recovered", 4554),
      OrdinalCases("Deaths", 50),
    ];

    final seriesList = [
      charts.Series<OrdinalCases, String>(
        id: 'China Cases',
        domainFn: (OrdinalCases cases, _) => cases.country,
        measureFn: (OrdinalCases cases, _) => cases.total,
        data: data,
        labelAccessorFn: (OrdinalCases cases, _) {
          return '${NumberFormat().format(cases.total)}';
        },
        colorFn: (cases, index) {
          switch (cases.country) {
            case 'Confirmed':
              return charts.ColorUtil.fromDartColor(Colors.blue);
            case 'Recovered':
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
        "Cases in Bangladesh",
        style: Theme.of(context).textTheme.headline,
      ),
      Padding(
        padding: EdgeInsets.only(top: 6),
      ),
      Container(
          height: 120,
          child: charts.BarChart(
            seriesList,
            animate: true,
            barRendererDecorator: new charts.BarLabelDecorator<String>(),
            domainAxis: new charts.OrdinalAxisSpec(),
          )),
      Padding(
        padding: EdgeInsets.only(bottom: 16),
      ),
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
