class KhandaModel {
  String? message;
  List<KhandaData>? data;

  KhandaModel({this.message, this.data});

  KhandaModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <KhandaData>[];
      json['data'].forEach((v) {
        data!.add(new KhandaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KhandaData {
  int? id;
  Name? name;
  String? position;

  KhandaData({this.id, this.name, this.position});

  KhandaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['position'] = this.position;
    return data;
  }
}

class Name {
  String? en;
  String? np;

  Name({this.en, this.np});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    np = json['np'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['np'] = this.np;
    return data;
  }
}
