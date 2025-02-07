class Education {
  String? message;
  String? module;
  List<EducationData>? data;

  Education({this.message, this.module, this.data});

  Education.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    module = json['module'];
    if (json['data'] != null) {
      data = <EducationData>[];
      json['data'].forEach((v) {
        data!.add(EducationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['module'] = module;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationData {
  Title? title;
  Title? heading;
  Title? desciption;

  EducationData({
    this.title,
    this.heading,
    this.desciption,
  });

  EducationData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    heading = json['heading'] != null ? Title.fromJson(json['heading']) : null;
    desciption = json['desciption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (heading != null) {
      data['heading'] = heading!.toJson();
    }
    data['desciption'] = desciption;

    return data;
  }
}

class Title {
  String? en;
  String? np;

  Title({this.en, this.np});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    np = json['np'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['np'] = np;
    return data;
  }
}
