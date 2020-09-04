import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/model/district_data.dart';
import 'package:flutter_healthcare_app/src/model/today_daily_corona_data.dart';
import 'package:flutter_healthcare_app/src/model/two_days_ago_model.dart';
import 'package:flutter_healthcare_app/src/model/yesterday_daily_data.dart';
import 'package:flutter_healthcare_app/src/pages/Widget/constant.dart';
import 'package:flutter_healthcare_app/src/pages/Widget/counter.dart';
import 'package:flutter_healthcare_app/src/pages/Widget/nav_drawer.dart';
import 'package:flutter_healthcare_app/src/pages/circular_progression.dart';
import 'package:flutter_healthcare_app/src/provider/today_provider.dart';
import 'package:flutter_healthcare_app/src/provider/two_days_ago_provider.dart';
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
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.dis}) : super(key: key);
  final DistrictData dis;
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
  bool twoyesterflag = false;

  int infected;
  int death;
  int recovered;
  String strdate;
  int intdate;

  bool notfound = true;
  bool doneToday = false;
  int totaltestDoneToday;
  int totaltestDoneYesterday;
  int totaltestDone;

  yesterdayDailyData yes;
  todayDailyData tod;
  TwoDaysAgoDailyData tdago;

  final TodayDailyProvider td = TodayDailyProvider();
  final YesterdayDailyProvider yd = YesterdayDailyProvider();
  final TwoDaysAgoDailyProvider tda = TwoDaysAgoDailyProvider();
  DistrictData dis;
  DailyData dailyd;

  @override
  void initState() {
    Future<todayDailyData> daily = td.getTodayDailyProvider();
    daily.then((ui) {
      if (ui.todayCases == 0 && ui.todayDeaths == 0 && ui.todayRecovered == 0) {
        todayflag = false;
        tod = ui;
      } else {
        tod = ui;
        todayflag = true;
      }
      doneToday = true;
      setState(() {});
    });

    Future<TwoDaysAgoDailyData> dailyt = tda.getTwoDaysAgoDailyProvider();
    dailyt.then((uid) {
      twoyesterflag = true;
      tdago = uid;

      setState(() {});
    });

    Future<yesterdayDailyData> dailyYes = yd.getYesterdayDailyProvider();
    dailyYes.then((u) {
      yesterflag = true;
      yes = u;

      setState(() {});
    });

    dis = widget.dis;

    doctorDataList = TestMapList.map((x) => DoctorModel.fromJson(x)).toList();
    doctorDataList.sort((a, b) => a.name.compareTo(b.name));
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
                    "বিস্তারিত",
                    style: TextStyles.titleNormal
                        .copyWith(color: Theme.of(context).primaryColor),
                  ).p(8).ripple(() {
                    Map<String, dynamic> yourMap = {
                      "today": this.tod,
                      "yesterday": this.yes,
                      "twodays": this.tdago,
                      "district": this.dis,
                    };
                    Navigator.pushNamed(context, "/DashboardDetailPage",
                        arguments: yourMap);
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
      aspectRatio: 7 / 8,
      child: Container(
        height: MediaQuery.of(context).size.height * (3 / 5),
        width: AppTheme.fullWidth(context) * .5,
        margin: EdgeInsets.only(left: 2, right: 2, bottom: 20, top: 10),
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
                      height: MediaQuery.of(context).size.width * (.5 / 5),
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
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("ঘরে বসে করোনা পরীক্ষা করুন", style: TextStyles.title.bold),
              /*IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})*/
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          SizedBox(height: 20),
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
                      "333",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .apply(color: Colors.brown),
                    ),
                    Text("জাতীয় কল সেন্টার")
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "16263",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .apply(color: Colors.green),
                    ),
                    Text("স্বাস্থ্য বাতায়ন")
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "10655",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .apply(color: Colors.orange),
                    ),
                    Text("আইইডিসিআর")
                  ],
                )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "09611677777",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .apply(color: Colors.purple),
                    ),
                    Text("বিশেষজ্ঞ হেলথ লাইন")
                  ],
                )),
              ])),
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
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
          height: MediaQuery.of(context).size.height / 8,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          color: Colors.amberAccent[100],
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
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
            title: Text(model.name, style: TextStyles.titleM),
            subtitle: Text(
              model.location,
              style: TextStyles.title.subTitleColor.bold,
            ),
            trailing: Container(
              //height: MediaQuery.of(context).size.height / 8,
              //width :
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
              child: Icon(
                Icons.phone,
                color: Colors.blue,
                size: MediaQuery.of(context).size.width / 10,
              ),
            ).ripple(
              () {
                print("done");
                launch("tel:" + model.phone);
              },
              //borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
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
    if ((yesterflag == false || twoyesterflag == false || doneToday == false)) {
      return ProgressHUD(
        child: Container(
          color: Colors.white,
        ),
        inAsyncCall: true,
        opacity: 0.0,
      );
    } else if (todayflag == false) {
      infected = yes.todayCases;
      death = yes.todayDeaths;
      recovered = yes.todayRecovered;
      intdate = yes.updated;
      DateTime date = new DateTime.fromMillisecondsSinceEpoch(intdate);
      var format = new DateFormat("EEE, MMM d, yyyy");
      strdate = format.format(date);
      totaltestDoneToday = yes.tests;
      totaltestDoneYesterday = tdago.tests;
      totaltestDone = totaltestDoneToday - totaltestDoneYesterday;
    } else {
      infected = tod.todayCases;
      death = tod.todayDeaths;
      recovered = tod.todayRecovered;
      intdate = tod.updated;
      DateTime date = new DateTime.fromMillisecondsSinceEpoch(intdate);
      var format = new DateFormat("EEE, MMM d, yyyy");
      strdate = format.format(date);
      totaltestDoneToday = tod.tests;
      totaltestDoneYesterday = yes.tests;
      totaltestDone = totaltestDoneToday - totaltestDoneYesterday;
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
