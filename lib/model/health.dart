class Health {
  String? message;
  List<HealthData>? data;

  Health({this.message, this.data});

  Health.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <HealthData>[];
      json['data'].forEach((v) {
        data!.add(HealthData.fromJson(v));
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

class HealthData {
  Title? title;
  Title? details;
  Title? heading;
  String? slug;
  int? status;

  HealthData({this.title, this.details, this.heading, this.slug, this.status});

  HealthData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    details = json['details'] != null ? Title.fromJson(json['details']) : null;
    heading = json['heading'] != null ? Title.fromJson(json['heading']) : null;
    slug = json['slug'];
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
    if (heading != null) {
      data['heading'] = heading!.toJson();
    }
    data['slug'] = slug;
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
