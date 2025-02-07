class VisitArea {
  String? value;
  String? text;

  VisitArea({this.value, this.text});

  VisitArea.fromJson(Map<String, dynamic> json) {
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
