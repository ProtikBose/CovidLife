class DistrictData {
  List<Data> data;
  String updatedOn;

  DistrictData({this.data, this.updatedOn});

  DistrictData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['updated_on'] = this.updatedOn;
    return data;
  }
}

class Data {
  int count;
  int id;
  String name;
  int prevCount;

  Data({this.count, this.id, this.name, this.prevCount});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    id = json['id'];
    name = json['name'];
    prevCount = json['prev_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['id'] = this.id;
    data['name'] = this.name;
    data['prev_count'] = this.prevCount;
    return data;
  }
}
