class FormModel {
  String? message;
  List<DownloadFormData>? data;

  FormModel({this.message, this.data});

  FormModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DownloadFormData>[];
      json['data'].forEach((v) {
        data!.add(new DownloadFormData.fromJson(v));
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

class DownloadFormData {
  int? id;
  Title? title;
  Title? information;
  String? fiscalYear;
  String? files;

  DownloadFormData({this.id, this.title, this.information, this.fiscalYear, this.files});

  DownloadFormData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    information = json['information'] != null
        ? new Title.fromJson(json['information'])
        : null;
    fiscalYear = json['fiscal_year'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.information != null) {
      data['information'] = this.information!.toJson();
    }
    data['fiscal_year'] = this.fiscalYear;
    data['files'] = this.files;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['np'] = this.np;
    return data;
  }
}