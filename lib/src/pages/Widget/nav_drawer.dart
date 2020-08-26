import 'package:flutter/material.dart';

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
          ListTile(
            leading: Icon(Icons.input),
            title: Text('নিকটবর্তী হাসপাতাল সমূহ'),
            onTap: () => {Navigator.pushNamed(context, "/MedicalDetailPage")},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('করোনা সংক্রান্ত তথ্য'),
            onTap: () => {Navigator.pushNamed(context, "/TipsDetailPage")},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('গুজব থেকে দূরে থাকুন'),
            onTap: () => {Navigator.pushNamed(context, "/RumorsDetailPage")},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
