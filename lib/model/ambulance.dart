class Ambulance {
  String? message;
  String? module;
  List<AmbulanceData>? data;

  Ambulance({this.message, this.module, this.data});

  Ambulance.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    module = json['module'];
    if (json['data'] != null) {
      data = <AmbulanceData>[];
      json['data'].forEach((v) {
        data!.add(AmbulanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['module'] = module;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AmbulanceData {
  DriverName? driverName;
  DriverName? address;
  String? vehicleNumber;
  String? phone;
  String? altPhone;
  int? status;

  AmbulanceData(
      {this.driverName,
      this.address,
      this.vehicleNumber,
      this.phone,
      this.altPhone,
      this.status});

  AmbulanceData.fromJson(Map<String, dynamic> json) {
    driverName = json['driver_name'] != null
        ? DriverName.fromJson(json['driver_name'])
        : null;
    address =
        json['address'] != null ? DriverName.fromJson(json['address']) : null;
    vehicleNumber = json['vehicle_number'];
    phone = json['phone'];
    altPhone = json['alt_phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (driverName != null) {
      data['driver_name'] = driverName!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['vehicle_number'] = vehicleNumber;
    data['phone'] = phone;
    data['alt_phone'] = altPhone;
    data['status'] = status;
    return data;
  }
}

class DriverName {
  String? en;
  String? np;

  DriverName({this.en, this.np});

  DriverName.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    np = json['np'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['np'] = np;
    return data;
  }
}
