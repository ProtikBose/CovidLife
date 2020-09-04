import 'dart:convert';

class DoctorModel {
  String name;
  String image;
  String phone;
  String location;

  DoctorModel({this.name, this.image, this.phone, this.location});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    phone = json['phone:'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone:'] = this.phone;
    data['location'] = this.location;
    return data;
  }
}
