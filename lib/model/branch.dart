class Branches {
  String? message;
  List<BranchData>? data;

  Branches({this.message, this.data});

  Branches.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BranchData>[];
      json['data'].forEach((v) {
        data!.add(BranchData.fromJson(v));
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

class BranchData {
  Information? information;
  Information? title;
  int? status;

  BranchData({this.information, this.title, this.status});

  BranchData.fromJson(Map<String, dynamic> json) {
    information = json['information'] != null
        ?  Information.fromJson(json['information'])
        : null;
    title =
        json['title'] != null ?  Information.fromJson(json['title']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (information != null) {
      data['information'] = information!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Information {
  String? en;
  String? np;

  Information({this.en, this.np});

  Information.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    np = json['np'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['en'] = en;
    data['np'] = np;
    return data;
  }
}
