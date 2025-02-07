class Tax {
  String? message;
  List<TaxData>? data;

  Tax({this.message, this.data});

  Tax.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TaxData>[];
      json['data'].forEach((v) {
        data!.add(TaxData.fromJson(v));
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

class TaxData {
  Title? title;
  Title? lawType;
  Title? lawLevel;
  Title? tags;
  int? status;
  String? document;

  TaxData(
      {this.title,
      this.lawType,
      this.lawLevel,
      this.tags,
      this.status,
      this.document});

  TaxData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    lawType =
        json['law_type'] != null ? Title.fromJson(json['law_type']) : null;
    lawLevel =
        json['law_level'] != null ? Title.fromJson(json['law_level']) : null;
    tags = json['tags'] != null ? Title.fromJson(json['tags']) : null;
    status = json['status'];
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (lawType != null) {
      data['law_type'] = lawType!.toJson();
    }
    if (lawLevel != null) {
      data['law_level'] = lawLevel!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.toJson();
    }
    data['status'] = status;
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
