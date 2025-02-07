class Sport {
  String? message;
  List<SportData>? data;

  Sport({this.message, this.data});

  Sport.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SportData>[];
      json['data'].forEach((v) {
        data!.add(SportData.fromJson(v));
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

class SportData {
  Heading? heading;
  Heading? title;
  Heading? description;
  String? document;
  String? slug;

  SportData({
    this.heading,
    this.title,
    this.description,
    this.document,
    this.slug,
  });

  SportData.fromJson(Map<String, dynamic> json) {
    heading =
        json['heading'] != null ? Heading.fromJson(json['heading']) : null;
    title = json['title'] != null ? Heading.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Heading.fromJson(json['description'])
        : null;
    document = json['document'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (heading != null) {
      data['heading'] = heading!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['document'] = document;
    data['slug'] = slug;

    return data;
  }
}

class Heading {
  String? en;
  String? np;

  Heading({this.en, this.np});

  Heading.fromJson(Map<String, dynamic> json) {
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
