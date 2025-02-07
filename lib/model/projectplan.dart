class ProjectPlan {
  String? message;
  List<ProjectplanData>? data;

  ProjectPlan({this.message, this.data});

  ProjectPlan.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ProjectplanData>[];
      json['data'].forEach((v) {
        data!.add(ProjectplanData.fromJson(v));
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

class ProjectplanData {
  Title? title;
  Title? description;
  String? date;
  int? status;
  String? document;

  ProjectplanData(
      {this.title, this.description, this.date, this.status, this.document});

  ProjectplanData.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    date = json['date'];
    status = json['status'];
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['date'] = date;
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
