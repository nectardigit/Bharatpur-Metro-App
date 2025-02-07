class Section {
  String? message;
  List<SectionData>? data;

  Section({this.message, this.data});

  Section.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SectionData>[];
      json['data'].forEach((v) {
        data!.add(SectionData.fromJson(v));
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

class SectionData {
  String? images;
  Features? features;
  String? heading;
  Features? title;
  Features? description;
  int? status;

  SectionData(
      {this.images,
      this.features,
      this.heading,
      this.title,
      this.description,
      this.status});

  SectionData.fromJson(Map<String, dynamic> json) {
    images = json['images'];
    features =
        json['features'] != null ? Features.fromJson(json['features']) : null;
    heading = json['heading'];
    title = json['title'] != null ? Features.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Features.fromJson(json['description'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images;
    if (features != null) {
      data['features'] = features!.toJson();
    }
    data['heading'] = heading;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Features {
  String? en;
  String? np;

  Features({this.en, this.np});

  Features.fromJson(Map<String, dynamic> json) {
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
