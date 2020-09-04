import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/district_data.dart';
import 'dart:async';

import 'package:flutter_healthcare_app/src/theme/text_styles.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class WholeCountryboardGlobal extends StatefulWidget {
  @override
  final DistrictData districtd;

  WholeCountryboardGlobal({Key key, this.districtd}) : super(key: key);
  _WholeCountryboardGlobalState createState() {
    return _WholeCountryboardGlobalState();
  }
}

class _WholeCountryboardGlobalState extends State<WholeCountryboardGlobal> {
  DistrictData districtd;
  List<Data> districts = List();
  List<Data> filteredDistricts = List();
  final _debouncer = Debouncer(milliseconds: 250);
  String date;
  @override
  void initState() {
    districtd = widget.districtd;
    if (districtd != null) {
      districts = districtd.data;
      filteredDistricts = districts;
      List<String> lst = districtd.updatedOn.split(" ");
      date = lst[0] + " " + lst[1] + " " + lst[2] + " " + lst[3];
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    if (districtd == null) {
      return Center(
        child: Text("আপাতত ডাটা নেই"),
      );
    } else {
      return Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'জেলার নাম দিয়ে সার্চ করুন',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredDistricts = districts
                      .where((u) =>
                          (u.name.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "সর্বশেষ আপডেট - " + date,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredDistricts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  color: Colors.lightBlue[100],
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          filteredDistricts[index].name,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1.5,
                          endIndent:
                              MediaQuery.of(context).size.width * (3 / 8),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "গত ২৪ ঘন্টায় আক্রান্ত - " +
                              (filteredDistricts[index].count -
                                      filteredDistricts[index].prevCount)
                                  .toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "এখন পর্যন্ত মোট আক্রান্ত - " +
                              (filteredDistricts[index].count).toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
