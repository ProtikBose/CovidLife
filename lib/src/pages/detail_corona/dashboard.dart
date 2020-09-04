import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/district_data.dart';
import 'package:flutter_healthcare_app/src/model/today_daily_corona_data.dart';
import 'package:flutter_healthcare_app/src/model/two_days_ago_model.dart';
import 'package:flutter_healthcare_app/src/model/yesterday_daily_data.dart';
import 'package:flutter_healthcare_app/src/pages/detail_corona/statistics.dart';
import 'package:flutter_healthcare_app/src/pages/detail_corona/wholecountry.dart';

class DashboardDetailPage extends StatefulWidget {
  //DetailPage({Key key, this.model}) : super(key: key);
  DashboardDetailPage({Key key, this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  _DashboardDetailPageState createState() => _DashboardDetailPageState();
}

class _DashboardDetailPageState extends State<DashboardDetailPage> {
  //DailyData modelOne;
  todayDailyData tod;
  yesterdayDailyData yes;
  TwoDaysAgoDailyData tdago;
  DistrictData modelTwo;
  @override
  void initState() {
    //model = widget.model;
    tod = widget.map["today"];
    yes = widget.map["yesterday"];
    tdago = widget.map["twodays"];
    modelTwo = widget.map["district"];
    //print(modelOne.death.last24);
    print(tod.cases);
    //print(modelTwo.data[1].name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('বিস্তারিত করোনা তথ্য'),
          backgroundColor:
              Colors.blue, //Set the background color on the navigation
          centerTitle: true,
          bottom: TabBar(
            //isScrollable: true,
            tabs: <Widget>[
              //Configure the Tabs menu, the system will display the order of the elements in the body:TabBarView according to the order configured here
              Tab(
                text: 'পরিসংখ্যান',
              ),
              Tab(
                text: 'সারা দেশে',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DetailsboardGlobal(
              dailyd: tod,
              yesd: yes,
              tdagod: tdago,
            ),
            WholeCountryboardGlobal(
              districtd: modelTwo,
            ),
          ],
        ),
      ),
    );
  }
}
