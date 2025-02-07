// ignore_for_file: unnecessary_this

class Profile {
  String? name;
  String? employeeNo;
  String? office;

  Profile({this.name, this.employeeNo, this.office});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    employeeNo = json['employeeNo'];
    office = json['office'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['employeeNo'] = employeeNo;
    data['office'] = this.office;
    return data;
  }
}
