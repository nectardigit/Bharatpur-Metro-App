class VisitVehicle {
  String? value;
  String? text;

  VisitVehicle({this.value, this.text});

  VisitVehicle.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['text'] = text;
    return data;
  }
}
