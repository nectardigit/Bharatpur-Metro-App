class Visit {
  String? visitArea;
  String? visitTypeName;
  String? dateFrom;
  String? dateTo;
  int? totalDays;
  String? remarks;
  int? approvedStatus;

  Visit(
      {this.visitArea,
      this.visitTypeName,
      this.dateFrom,
      this.dateTo,
      this.totalDays,
      this.remarks,
      this.approvedStatus});

  Visit.fromJson(Map<String, dynamic> json) {
    visitArea = json['visitArea'];
    visitTypeName = json['visitTypeName'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    totalDays = json['totalDays'];
    remarks = json['remarks'];
    approvedStatus = json['approvedStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['visitArea'] = visitArea;
    data['visitTypeName'] = visitTypeName;
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    data['totalDays'] = totalDays;
    data['remarks'] = remarks;
    data['approvedStatus'] = approvedStatus;
    return data;
  }
}
