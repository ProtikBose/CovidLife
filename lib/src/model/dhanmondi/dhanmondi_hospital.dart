import 'dart:convert';

class HospitalModel {
  String name;
  String type;
  String description;
  double rating;
  bool isfavourite;
  String image;
  String phone;
  String hours;
  String address;

  HospitalModel({
    this.name,
    this.type,
    this.description,
    this.rating,
    this.phone,
    this.hours,
    this.address,
    this.isfavourite,
    this.image,
  });

  HospitalModel copyWith({
    String name,
    String type,
    String description,
    double rating,
    String phone,
    String hours,
    String address,
    bool isfavourite,
    String image,
  }) =>
      HospitalModel(
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        phone: phone ?? this.phone,
        hours: hours ?? this.hours,
        address: address ?? this.address,
        isfavourite: isfavourite ?? this.isfavourite,
        image: image ?? this.image,
      );

  factory HospitalModel.fromRawJson(String str) =>
      HospitalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        phone: json["phone"] == null ? null : json["phone"],
        hours: json["hours"] == null ? null : json["hours"],
        address: json["address"] == null ? null : json["address"],
        isfavourite: json["isfavourite"] == null ? null : json["isfavourite"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "rating": rating == null ? null : rating,
        "phone": phone == null ? null : phone,
        "hours": hours == null ? null : hours,
        "address": address == null ? null : address,
        "isfavourite": isfavourite == null ? null : isfavourite,
        "image": image == null ? null : image,
      };
}
