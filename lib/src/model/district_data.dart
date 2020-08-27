class DistrictData {
  List<Data> _data;
  String _updatedOn;

  DistrictData({List<Data> data, String updatedOn}) {
    this._data = data;
    this._updatedOn = updatedOn;
  }

  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  String get updatedOn => _updatedOn;
  set updatedOn(String updatedOn) => _updatedOn = updatedOn;

  DistrictData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['updated_on'] = this._updatedOn;
    return data;
  }
}

class Data {
  int _count;
  int _id;
  String _name;
  int _prevCount;

  Data({int count, int id, String name, int prevCount}) {
    this._count = count;
    this._id = id;
    this._name = name;
    this._prevCount = prevCount;
  }

  int get count => _count;
  set count(int count) => _count = count;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get prevCount => _prevCount;
  set prevCount(int prevCount) => _prevCount = prevCount;

  Data.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _id = json['id'];
    _name = json['name'];
    _prevCount = json['prev_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['id'] = this._id;
    data['name'] = this._name;
    data['prev_count'] = this._prevCount;
    return data;
  }
}
