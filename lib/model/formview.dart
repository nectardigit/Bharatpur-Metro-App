class Formview {
  String? message;
  List<FormviewData>? data;

  Formview({this.message, this.data});

  Formview.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <FormviewData>[];
      json['data'].forEach((v) {
        data!.add(FormviewData.fromJson(v));
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

class FormviewData {
  String? date;
  Heading? heading;
  Heading? title;
  Heading? description;
  String? document;
  int? status;

  FormviewData(
      {this.date,
      this.heading,
      this.title,
      this.description,
      this.document,
      this.status});

  FormviewData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    heading =
        json['heading'] != null ? Heading.fromJson(json['heading']) : null;
    title = json['title'] != null ? Heading.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Heading.fromJson(json['description'])
        : null;
    document = json['document'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
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
    data['status'] = status;
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
