import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';

class TipsListPage extends StatefulWidget {
  TipsListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TipsListPageState createState() => _TipsListPageState();
}

class _TipsListPageState extends State<TipsListPage> {
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
                  color: LightColor.skyBlue,
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
                              "করোনা সংক্রান্ত তথ্য",
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
                "assets/tips.jpg",
                height: 100,
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              Text("মাস্ক পড়ুন, সুস্থ থাকুন",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              //card number one
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "আপনার হাত প্রায়শই পরিষ্কার করুন। সাবান এবং পানি বা অ্যালকোহল রয়েছে এমন হ্যান্ডওয়াশ ব্যবহার করুন",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              //card number two
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "কাশি বা হাঁচি হচ্ছে এমন ব্যক্তির থেকে নিরাপদ দূরত্ব বজায় রাখুন",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              //card number three
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "দূরত্ব বজায় রাখা সম্ভব না হলে মাস্ক ব্যবহার করুন",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              //card number four
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "আপনার চোখ, নাক বা মুখ স্পর্শ করবেন না",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              //card number five
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "কাশি বা হাঁচির সময় আপনার নাক এবং মুখটি কনুই ভাঁজ করে বা টিস্যু দিয়ে কভার করুন",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              //card number six
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "অসুস্থ বোধ করলে বাড়িতেই থাকুন",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              //card number seven
              Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 212, 238, 252)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.black))),
                      child: Icon(Icons.beenhere, color: Colors.black),
                    ),
                    title: Text(
                      "জ্বর, কাশি এবং শ্বাসকষ্ট হলে ডাক্তারের পরামর্শ নিন",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
