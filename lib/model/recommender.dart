class Recommender {
  int? id;
  String? name;
  String? employeeNo;
  String? office;

  Recommender({this.id, this.name, this.employeeNo, this.office});

  Recommender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    employeeNo = json['employeeNo'];
    office = json['office'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['employeeNo'] = employeeNo;
    data['office'] = office;
    return data;
  }
}
