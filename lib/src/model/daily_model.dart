// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class DailyData {
  Death death;
  Death positive;
  Death recovered;
  Death test;
  String updatedOn;

  DailyData(
      {this.death, this.positive, this.recovered, this.test, this.updatedOn});

  DailyData.fromJson(Map<String, dynamic> json) {
    death = json['death'] != null ? new Death.fromJson(json['death']) : null;
    positive =
        json['positive'] != null ? new Death.fromJson(json['positive']) : null;
    recovered = json['recovered'] != null
        ? new Death.fromJson(json['recovered'])
        : null;
    test = json['test'] != null ? new Death.fromJson(json['test']) : null;
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.death != null) {
      data['death'] = this.death.toJson();
    }
    if (this.positive != null) {
      data['positive'] = this.positive.toJson();
    }
    if (this.recovered != null) {
      data['recovered'] = this.recovered.toJson();
    }
    if (this.test != null) {
      data['test'] = this.test.toJson();
    }
    data['updated_on'] = this.updatedOn;
    return data;
  }
}

class Death {
  int last24;
  int total;

  Death({this.last24, this.total});

  Death.fromJson(Map<String, dynamic> json) {
    last24 = json['last24'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last24'] = this.last24;
    data['total'] = this.total;
    return data;
  }
}
