class Leave {
  String? leaveTypeName;
  String? dateFrom;
  String? dateTo;
  bool? isHalfDay;
  double? totalDays;
  String? remarks;
  int? approvedStatus;

  Leave(
      {this.leaveTypeName,
      this.dateFrom,
      this.dateTo,
      this.isHalfDay,
      this.totalDays,
      this.remarks,
      this.approvedStatus});

  Leave.fromJson(Map<String, dynamic> json) {
    leaveTypeName = json['leaveTypeName'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    isHalfDay = json['isHalfDay'];
    totalDays = json['totalDays'];
    remarks = json['remarks'];
    approvedStatus = json['approvedStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leaveTypeName'] = leaveTypeName;
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    data['isHalfDay'] = isHalfDay;
    data['totalDays'] = totalDays;
    data['remarks'] = remarks;
    data['approvedStatus'] = approvedStatus;
    return data;
  }
}
