class NotificationModel {
  bool? status;
  String? message;
  List<NotificationData>? data;

  NotificationModel({this.status, this.message, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
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

class NotificationData {
  int? id;
  Title? title;
  String? published;
  String? files;

  NotificationData({this.id, this.title, this.published, this.files});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    published = json['published'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['published'] = this.published;
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
