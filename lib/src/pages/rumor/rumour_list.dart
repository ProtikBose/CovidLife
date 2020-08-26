import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';

var orange = Color(0xFFfc9f6a);
var pink = Color(0xFFee528c);
var blue = Color(0xFF8bccd6);
var darkBlue = Color(0xFF60a0d7);
var valueBlue = Color(0xFF5fa0d6);

class RumorsListPage extends StatefulWidget {
  RumorsListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RumorsListPageState createState() => _RumorsListPageState();
}

class _RumorsListPageState extends State<RumorsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
            ]),
            width: MediaQuery.of(context).size.width,
            height: 95,
            child: Container(
              decoration: BoxDecoration(
                  color: LightColor.orange,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: BackButton(color: Colors.white)),
                    Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              "গুজব থেকে দূরে থাকুন",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ))),
                    Icon(
                      Icons.navigate_before,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 14),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/rumor.jpg",
                height: 100,
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              Text("নিচের গুজবগুলো থেকে দূরে থাকুন...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              //card number one
              ItemCard(
                  'দশ সেকেন্ড বা তার বেশি সময় শ্বাস ধরে রাখতে পারলে করোনাভাইরাস রোগ থেকে মুক্ত ',
                  [orange, pink]),
              SizedBox(
                height: 10.0,
              ),
              ItemCard('রসুন করোনা ভাইরাসের সংক্রমণ প্রতিরোধে কাজ করে ',
                  [orange, pink]),
              SizedBox(
                height: 10.0,
              ),
              ItemCard('ধূমপানে কোভিড-১৯ সংক্রমণে কোনো প্রভাব পড়ে না ',
                  [orange, pink]),
              SizedBox(
                height: 10.0,
              ),
              ItemCard(
                  'সারা গায়ে অ্যালকোহল বা ক্লোরিন ছিটিয়ে নভেল করোনা ভাইরাস মেরে ফেলা সম্ভব ',
                  [orange, pink]),
              SizedBox(
                height: 10.0,
              ),
              ItemCard(
                  'করোনা ভাইরাস প্রতিরোধে নিউমোনিয়া ভ্যাকসিন কার্যকরী ভূমিকা পালন করে ',
                  [orange, pink]),
              SizedBox(
                height: 10.0,
              ),
              ItemCard(
                  'স্যালাইন দিয়ে নিয়মিত নাক পরিষ্কার করে করোনা ভাইরাস প্রতিহত করা সম্ভব ',
                  [orange, pink]),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ));
  }
}

class ItemCard extends StatelessWidget {
  final titel;
  final colors;

  ItemCard(this.titel, this.colors);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: colors),
            borderRadius: BorderRadius.circular(4.0)),
        child: Text(
          titel,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
