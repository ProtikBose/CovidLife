import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/dhanmondi/dhanmondi_data.dart';
import 'package:flutter_healthcare_app/src/model/dhanmondi/dhanmondi_hospital.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';

class MedicalListPage extends StatefulWidget {
  MedicalListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MedicalListPageState createState() => _MedicalListPageState();
}

class _MedicalListPageState extends State<MedicalListPage> {
  String _dropDownValue = "";
  String searchOption = "";
  bool action = false;
  List<HospitalModel> dhanmondiDataList;

  void initState() {
    /*
    Provider.of<DailyProvider>(context, listen: false)
        .getDailyProvider(datetime);
      */
    dhanmondiDataList =
        dhanmondiHospitalMapList.map((x) => HospitalModel.fromJson(x)).toList();
    dhanmondiDataList.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

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
                color: Color.fromARGB(255, 47, 220, 157),
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
                            "নিকটবর্তী হাসপাতাল সমূহ",
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //_header(),

                _dropDownlabel(),
                _searchButton(),
                _selectWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectWidget() {
    if (searchOption == "ধানমন্ডি" && action) {
      return _forOne("ধানমন্ডি");
    } else if (searchOption == "Two" && action) {
      return _forTwo();
    } else
      return Container();
  }

  Widget _dropDownlabel() {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        //color: Colors.white24,
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.all(Radius.circular(0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: LightColor.grey.withOpacity(.3),
              blurRadius: 15,
              offset: Offset(5, 5),
            )
          ],
        ),
        child: DropdownButton(
          hint: _dropDownValue == ""
              ? Text(
                  'আপনার এলাকা বাছাই করুন',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )
              : Text(
                  _dropDownValue,
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
          isExpanded: true,
          iconSize: 50.0,
          isDense: true,
          elevation: 2,
          autofocus: true,
          style: TextStyle(color: Colors.blue),
          items: ['ধানমন্ডি', 'পান্থপথ', 'আজিম্পুর'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _dropDownValue = val;
              },
            );
          },
        ));
  }

  Widget _searchButton() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          setState(() {
            searchOption = _dropDownValue;
            action = true;
          });
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: const Text('Search', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  Widget _forOne(String location) {
    return SingleChildScrollView(
        // <- added
        child: Column(children: <Widget>[
      SizedBox(
        height: 25,
      ),
      Text(
        "পছন্দসই এলাকা - " + location,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.green),
        textAlign: TextAlign.left,
      ),
      SizedBox(
        height: 10,
      ),
      ListView(
          //scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          children: dhanmondiDataList.map((x) {
            return _doctorTile(x);
          }).toList())
    ]));
  }

  Widget _forTwo() {
    return Center(
      child: Text("dataTwo"),
    );
  }

  Widget _doctorTile(HospitalModel model) {
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
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: randomColor(),
              ),
              /*
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),*/
              child: Icon(Icons.local_hospital, color: Colors.black),
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
        Navigator.pushNamed(context, "/HospitalDetailPage", arguments: model);
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
}
