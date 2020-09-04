import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/district_data.dart';
import 'package:flutter_healthcare_app/src/model/yesterday_daily_data.dart';
import 'package:flutter_healthcare_app/src/pages/home_page.dart';
import 'package:flutter_healthcare_app/src/provider/district_provider.dart';
import 'package:flutter_healthcare_app/src/provider/yesterday_provider.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //DistrictData disData;
  DistrictData val;
  bool districtData = false;
  @override
  void initState() {
    /*
    final daily =
        Provider.of<DailyProvider>(context, listen: false).getDailyProvider();
    */
    final disData = Provider.of<DistrictDailyProvider>(context, listen: false)
        .getDailyDistrictProvider();
    disData.then((value) {
      print(value);
      districtData = true;
      val = value;
      print("Inside splash");
      print(val);
      setState(() {});
      /*
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
      */
      Navigator.pushNamed(context, "/HomePage", arguments: val);
    });

    /*
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    });
    */

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[50],
              image: DecorationImage(
                image: AssetImage("assets/newsplash2.png"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
