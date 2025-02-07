class Services {
  String? message;
  List<ServicesData>? data;

  Services({this.message, this.data});

  Services.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ServicesData>[];
      json['data'].forEach((v) {
        data!.add(ServicesData.fromJson(v));
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

class ServicesData {
  Title? title;
  Title? description;
  Title? office;
  Title? serviceGroup;

  ServicesData({
    this.title,
    this.description,
    this.office,
    this.serviceGroup,
  });

  ServicesData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    office = json['office'] != null ? Title.fromJson(json['office']) : null;
    serviceGroup = json['service_group'] != null
        ? Title.fromJson(json['service_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (office != null) {
      data['office'] = office!.toJson();
    }
    if (serviceGroup != null) {
      data['service_group'] = serviceGroup!.toJson();
    }
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
