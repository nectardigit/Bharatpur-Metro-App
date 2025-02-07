class FieldVisit {
  String? fieldDate;
  String? timeFrom;
  String? timeTo;
  String? approvedStatus;
  String? remarks;
  String? officeName;

  FieldVisit(
      {this.fieldDate,
      this.timeFrom,
      this.timeTo,
      this.approvedStatus,
      this.remarks,
      this.officeName});

  FieldVisit.fromJson(Map<String, dynamic> json) {
    fieldDate = json['fieldDate'];
    timeFrom = json['timeFrom'];
    timeTo = json['timeTo'];
    approvedStatus = json['approvedStatus'];
    remarks = json['remarks'];
    officeName = json['officeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldDate'] = fieldDate;
    data['timeFrom'] = timeFrom;
    data['timeTo'] = timeTo;
    data['approvedStatus'] = approvedStatus;
    data['remarks'] = remarks;
    data['officeName'] = officeName;
    return data;
  }
}
