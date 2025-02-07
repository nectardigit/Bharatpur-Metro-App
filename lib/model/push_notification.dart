class PushNotificationModel {
  bool? status;
  String? message;
  List<PushNotificationData>? data;

  PushNotificationModel({this.status, this.message, this.data});

  PushNotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PushNotificationData>[];
      json['data'].forEach((v) {
        data!.add(new PushNotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PushNotificationData {
  int? id;
  Title? title;
  String? time;
  String? files;
  String? published;
  Title? description;
  int? status;

  PushNotificationData(
      {this.id,
      this.title,
      this.time,
      this.files,
      this.published,
      this.description,
      this.status});

  PushNotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    time = json['time'];
    files = json['files'];
    published = json['published'];
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['time'] = this.time;
    data['files'] = this.files;
    data['published'] = this.published;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['status'] = this.status;
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
