import 'package:flutter/material.dart';

class WholeCountryboardGlobal extends StatefulWidget {
  @override
  _WholeCountryboardGlobalState createState() {
    return _WholeCountryboardGlobalState();
  }
}

class _WholeCountryboardGlobalState extends State<WholeCountryboardGlobal> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Second tab'),
        ),
        ListTile(
          title: Text('Second tab'),
        ),
        ListTile(
          title: Text('Second tab'),
        )
      ],
    );
  }
}
