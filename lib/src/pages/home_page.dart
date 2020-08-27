import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/model/today_daily_corona_data.dart';
import 'package:flutter_healthcare_app/src/model/yesterday_daily_data.dart';
import 'package:flutter_healthcare_app/src/pages/Widget/constant.dart';
import 'package:flutter_healthcare_app/src/pages/Widget/counter.dart';
import 'package:flutter_healthcare_app/src/pages/Widget/nav_drawer.dart';
import 'package:flutter_healthcare_app/src/pages/circular_progression.dart';
import 'package:flutter_healthcare_app/src/provider/today_provider.dart';
import 'package:flutter_healthcare_app/src/provider/yesterday_provider.dart';
import 'package:flutter_healthcare_app/src/provider/daily_provider.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/Utilities/app_style.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<DoctorModel> doctorDataList;
  String finalDate = '';
  todayDailyData daily;
  bool todayflag = false;
  bool yesterflag = false;
  int infected;
  int death;
  int recovered;
  String strdate;
  int intdate;
  bool notfound = true;
  int totaltestDoneToday;
  int totaltestDoneYesterday;
  int totaltestDone;
  yesterdayDailyData yes;
  final TodayDailyProvider td = TodayDailyProvider();
  final YesterdayDailyProvider yd = YesterdayDailyProvider();
  @override
  void initState() {
    //finalDate = getCurrentDate();
    //finalDate = "2020-08-18";
    //print(finalDate);
    //yes = widget.yes;
    /*
    if (todayflag == false) {
      Future<todayDailyData> daily = td.getTodayDailyProvider();
      daily.then((ui) {
        todayflag = true;

        infected = ui.todayCases;
        death = ui.todayDeaths;
        recovered = ui.todayRecovered;
        /*
      DateTime todayDate = DateTime.parse(u.updatedOn);
      print(todayDate);
      date = DateFormat("dd-MM-yyyy").format(todayDate);
      print(date);
      */
        intdate = ui.updated;
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(intdate);
        var format = new DateFormat("yMd");
        strdate = format.format(date);
        /*
      List<String> lst = date.split(" ");
      date = lst[0] + " " + lst[1] + " " + lst[2] + " " + lst[3];
      */
        totaltestDoneToday = ui.tests;
        setState(() {});
      });
    }

    if (yesterflag == false) {
      Future<yesterdayDailyData> dailyYes = yd.getYesterdayDailyProvider();
      dailyYes.then((u) {
        yesterflag = true;
        yes = u;
        totaltestDoneYesterday = u.tests;
        totaltestDone = totaltestDoneToday - totaltestDoneYesterday;
        setState(() {});
      });
    }
    */
    final daily =
        Provider.of<DailyProvider>(context, listen: false).getDailyProvider();
    daily.then((ui) {
      todayflag = true;

      infected = ui.positive.last24;
      death = ui.death.last24;
      recovered = ui.recovered.last24;

      /*
      DateTime todayDate = DateTime.parse(ui.updatedOn);
      print(todayDate);
      strdate = DateFormat("dd-MM-yyyy").format(todayDate);
      print(strdate);
      */
      List<String> lst = ui.updatedOn.split(" ");
      strdate = lst[0] + " " + lst[1] + " " + lst[2] + " " + lst[3];

      totaltestDone = ui.test.last24;
      setState(() {});
    });
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
        onPressed: () {
          print("Hi icon Button Pressed!!!");
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      actions: <Widget>[
        /*
        Icon(
          Icons.notifications_none,
          size: 30,
          color: LightColor.grey,
        ),
        */
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            // height: 40,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset(
              "assets/heartbeat.png",
              fit: BoxFit.fill,
              color: Colors.red,
            ),
          ),
        ).p(8),
      ],
    );
  }

  Widget titleWidget(title, subtitle, color) {
    return ListTile(
      title: Text(title, style: AppStyle.stdtw),
      subtitle:
          Text(subtitle, style: AppStyle.subtitleMain.copyWith(color: color)),
    );
  }

  Widget _showField() {
    return Container(
        child: Column(children: <Widget>[
      SizedBox(height: 10),
      //SizedBox(height: 20),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "সর্বশেষ আপডেট\n", style: kTitleTextstyle),
                        TextSpan(
                          text: "তারিখ: " + strdate,
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "বিস্তারিত...",
                    style: TextStyles.titleNormal
                        .copyWith(color: Theme.of(context).primaryColor),
                  ).p(8).ripple(() {
                    Navigator.pushNamed(context, "/DashboardDetailPage");
                  })
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Counter(
                      color: kInfectedColor,
                      number: infected.toString(),
                      title: "আক্রান্ত সংখ্যা",
                    ),
                    Counter(
                      color: kDeathColor,
                      number: death.toString(),
                      title: "মৃত",
                    ),
                    Counter(
                      color: kRecovercolor,
                      number: recovered.toString(),
                      title: "সুস্থ হয়েছেন",
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Counter(
                      color: Colors.indigo[300],
                      number: totaltestDone.toString(),
                      title: "নমুনা পরীক্ষা",
                    ),
                    Counter(
                      color: Colors.purple[300],
                      number: roundDouble((infected / totaltestDone) * 100, 2)
                              .toString() +
                          "%",
                      title: "শতকরা আক্রান্ত হার",
                    ),
                  ],
                ),
              ),
            ],
          )),
      SizedBox(height: 20),
      //SizedBox(height: 20),
    ]));
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("সুস্থ থাকুন, জেনে রাখুন", style: TextStyles.title.bold),
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard("নিকটবর্তী হাসপাতাল সমূহ", "\n",
                  color: LightColor.green, lightColor: LightColor.lightGreen),
              _categoryCard("করোনা সংক্রান্ত তথ্য", "\n",
                  color: LightColor.skyBlue, lightColor: LightColor.lightBlue),
              _categoryCard("গুজব থেকে দূরে থাকুন", "\n",
                  color: LightColor.orange, lightColor: LightColor.lightOrange)
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String subtitle,
      {Color color, Color lightColor}) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    TextStyle subtitleStyle = TextStyles.body.bold.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.bold.white;
      subtitleStyle = TextStyles.bodySm.bold.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: TextStyles.titleM).hP8,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    /*
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                    */
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {
          if (title == "নিকটবর্তী হাসপাতাল সমূহ") {
            Navigator.pushNamed(context, "/MedicalDetailPage");
          } else if (title == "করোনা সংক্রান্ত তথ্য") {
            Navigator.pushNamed(context, "/TipsDetailPage");
          } else if (title == "গুজব থেকে দূরে থাকুন") {
            Navigator.pushNamed(context, "/RumorsDetailPage");
          }
        }, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Doctors", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(() {
        Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    if (todayflag == false && yesterflag == false) {
      return ProgressHUD(
        child: Container(
          color: Colors.white,
        ),
        inAsyncCall: true,
        opacity: 0.0,
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      drawer: NavDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _showField(),
                _category(),
              ],
            ),
          ),
          _doctorsList()
        ],
      ),
    );
  }
}
