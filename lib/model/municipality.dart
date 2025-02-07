class Municipality {
  String? message;
  List<MunicipalityData>? data;

  Municipality({this.message, this.data});

  Municipality.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MunicipalityData>[];
      json['data'].forEach((v) {
        data!.add(MunicipalityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MunicipalityData {
  Title? title;
  Title? details;
  int? status;

  MunicipalityData({this.title, this.details, this.status});

  MunicipalityData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    details = json['details'] != null ? Title.fromJson(json['details']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['status'] = status;
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
