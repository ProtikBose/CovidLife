import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/daily_model.dart';
import 'package:flutter_healthcare_app/src/model/district_data.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(""),
            decoration: BoxDecoration(
                color: Colors.amber[200],
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/splash.png'))),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "CovidLife",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 10,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('নিকটবর্তী হাসপাতাল সমূহ'),
            onTap: () => {Navigator.pushNamed(context, "/MedicalDetailPage")},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('করোনা সংক্রান্ত তথ্য'),
            onTap: () => {Navigator.pushNamed(context, "/TipsDetailPage")},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('গুজব থেকে দূরে থাকুন'),
            onTap: () => {Navigator.pushNamed(context, "/RumorsDetailPage")},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('অ্যাপ প্রসঙ্গে'),
            onTap: () => {Navigator.pushNamed(context, "/InfoPage")},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1 / 7),
          ),
          Center(
            child: Text("সুস্থ থাকুন",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ),
          Center(
            child: Text("সাবধানে থাকুন",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          )
        ],
      ),
    );
  }
}
