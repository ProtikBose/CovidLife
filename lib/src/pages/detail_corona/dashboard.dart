import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/detail_corona/statistics.dart';
import 'package:flutter_healthcare_app/src/pages/detail_corona/wholecountry.dart';

class DashboardDetailPage extends StatefulWidget {
  //DetailPage({Key key, this.model}) : super(key: key);
  DashboardDetailPage({Key key}) : super(key: key);
  //final HospitalModel model;

  @override
  _DashboardDetailPageState createState() => _DashboardDetailPageState();
}

class _DashboardDetailPageState extends State<DashboardDetailPage> {
  //HospitalModel model;
  @override
  void initState() {
    //model = widget.model;
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
            DetailsboardGlobal(),
            WholeCountryboardGlobal(),
          ],
        ),
      ),
    );
  }
}
