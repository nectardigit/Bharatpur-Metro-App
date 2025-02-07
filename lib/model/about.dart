class About {
  String? message;
  List<AboutData>? data;

  About({this.message, this.data});

  About.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <AboutData>[];
      json['data'].forEach((v) {
        data!.add(new AboutData.fromJson(v));
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

class AboutData {
  CompanyName? companyName;
  String? email;
  String? phone;
  String? altPhone;
  CompanyName? address;
  String? fbLink;
  String? companyLogo;
  String? twitterLink;
  String? youtubeLink;
  String? instagramLink;
  String? mapUrl;
  String? metaTitle;
  Null? metaKeywords;
  String? metaDescription;

  AboutData(
      {this.companyName,
      this.email,
      this.phone,
      this.altPhone,
      this.address,
      this.fbLink,
      this.companyLogo,
      this.twitterLink,
      this.youtubeLink,
      this.instagramLink,
      this.mapUrl,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription});

  AboutData.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'] != null
        ? new CompanyName.fromJson(json['company_name'])
        : null;
    email = json['email'];
    phone = json['phone'];
    altPhone = json['alt_phone'];
    address = json['address'] != null
        ? new CompanyName.fromJson(json['address'])
        : null;
    fbLink = json['fb_link'];
    companyLogo = json['company_logo'];
    twitterLink = json['twitter_link'];
    youtubeLink = json['youtube_link'];
    instagramLink = json['instagram_link'];
    mapUrl = json['map_url'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyName != null) {
      data['company_name'] = this.companyName!.toJson();
    }
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['alt_phone'] = this.altPhone;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['fb_link'] = this.fbLink;
    data['company_logo'] = this.companyLogo;
    data['twitter_link'] = this.twitterLink;
    data['youtube_link'] = this.youtubeLink;
    data['instagram_link'] = this.instagramLink;
    data['map_url'] = this.mapUrl;
    data['meta_title'] = this.metaTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    return data;
  }
}

class CompanyName {
  String? en;
  String? np;

  CompanyName({this.en, this.np});

  CompanyName.fromJson(Map<String, dynamic> json) {
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
