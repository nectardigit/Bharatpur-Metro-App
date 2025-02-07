class SuchanaAdhikariModel {
  String? message;
  List<SuchanaAdhikariData>? data;

  SuchanaAdhikariModel({this.message, this.data});

  SuchanaAdhikariModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SuchanaAdhikariData>[];
      json['data'].forEach((v) {
        data!.add(new SuchanaAdhikariData.fromJson(v));
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

class SuchanaAdhikariData {
  int? id;
  String? profile;
  String? phone;
  String? email;
  Name? name;
  Name? designation;

  SuchanaAdhikariData(
      {this.id,
      this.profile,
      this.phone,
      this.email,
      this.name,
      this.designation});

  SuchanaAdhikariData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    phone = json['phone'];
    email = json['email'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    designation = json['designation'] != null
        ? new Name.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profile'] = this.profile;
    data['phone'] = this.phone;
    data['email'] = this.email;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.designation != null) {
      data['designation'] = this.designation!.toJson();
    }
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