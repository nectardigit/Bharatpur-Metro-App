class OnlineServices {
  String? message;
  List<OnlineServicesData>? data;

  OnlineServices({this.message, this.data});

  OnlineServices.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <OnlineServicesData>[];
      json['data'].forEach((v) {
        data!.add(new OnlineServicesData.fromJson(v));
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

class OnlineServicesData {
  int? id;
  Title? title;
  String? link;
  String? file;

  OnlineServicesData({this.id, this.title, this.link, this.file});

  OnlineServicesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    link = json['link'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['link'] = this.link;
    data['file'] = this.file;
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
