class PublicServiceModel {
  String? message;
  List<PublicSericeHeadingModel>? data;

  PublicServiceModel({this.message, this.data});

  PublicServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <PublicSericeHeadingModel>[];
      json['data'].forEach((v) {
        data!.add(new PublicSericeHeadingModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PublicSericeHeadingModel {
  int? serviceCategoryId;
  ServiceCategoryName? serviceCategoryName;
  int? id;
  ServiceCategoryName? title;
  String? files;
  Null? date;
  String? details;
  String? createdAt;

  PublicSericeHeadingModel(
      {this.serviceCategoryId,
        this.serviceCategoryName,
        this.id,
        this.title,
        this.files,
        this.date,
        this.details,
        this.createdAt});

  PublicSericeHeadingModel.fromJson(Map<String, dynamic> json) {
    serviceCategoryId = json['service_category_id'];
    serviceCategoryName = json['service_category_name'] != null
        ? new ServiceCategoryName.fromJson(json['service_category_name'])
        : null;
    id = json['id'];
    title = json['title'] != null
        ? new ServiceCategoryName.fromJson(json['title'])
        : null;
    files = json['files'];
    date = json['date'];
    details = json['details'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_category_id'] = this.serviceCategoryId;
    if (this.serviceCategoryName != null) {
      data['service_category_name'] = this.serviceCategoryName!.toJson();
    }
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['files'] = this.files;
    data['date'] = this.date;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class ServiceCategoryName {
  String? en;
  String? np;

  ServiceCategoryName({this.en, this.np});

  ServiceCategoryName.fromJson(Map<String, dynamic> json) {
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