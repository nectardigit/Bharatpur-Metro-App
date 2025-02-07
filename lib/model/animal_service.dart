class AnimalService {
  String? message;
  List<AnimalServiceData>? data;

  AnimalService({this.message, this.data});

  AnimalService.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <AnimalServiceData>[];
      json['data'].forEach((v) {
        data!.add(AnimalServiceData.fromJson(v));
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

class AnimalServiceData {
  Title? title;
  Title? details;
  Title? heading;
  String? slug;
  String? document;

  AnimalServiceData({
    this.title,
    this.details,
    this.heading,
    this.slug,
    this.document,
  });

  AnimalServiceData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    details = json['details'] != null ? Title.fromJson(json['details']) : null;
    heading = json['heading'] != null ? Title.fromJson(json['heading']) : null;
    slug = json['slug'];
    document = json['document'];
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
    data['document'] = document;

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
