class LeaveType {
  int? id;
  String? name;
  int? displayOrder;

  LeaveType({this.id, this.name, this.displayOrder});

  LeaveType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['displayOrder'] = displayOrder;
    return data;
  }
}
