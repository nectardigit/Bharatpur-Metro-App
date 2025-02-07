// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ApiService {
  // var base = "http://192.168.1.73:8000/api/";
  // var base = "http://192.168.1.78:8000/api/";
  var base = "https://gandakimun.amritsparsha.com/api/";

  //IntroductionPage APIs are here
  Future getIntro() async {
    try {
      var response = await http.get(Uri.parse('${base}intro'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getOrganizationStructure() async {
    try {
      var response = await http.get(Uri.parse('${base}organization'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getOfficerDetails() async {
    try {
      var response = await http.get(Uri.parse('${base}officer_details'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getteams() async {
    try {
      var response = await http.get(Uri.parse('${base}teams'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getJobDescrpition() async {
    try {
      var response = await http.get(Uri.parse('${base}job'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getWards() async {
    try {
      var response = await http.get(Uri.parse('${base}wards'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("ward datas is$data");
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getServices() async {
    try {
      var response = await http.get(Uri.parse('${base}services'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getHealth() async {
    try {
      var response = await http.get(Uri.parse('${base}health'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getBadaPatra() async {
    try {
      var response = await http.get(Uri.parse('${base}civil'));
      var data = jsonDecode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        return data['data'];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getCityScape() async {
    try {
      var response = await http.get(Uri.parse('${base}cityscape?id=1'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getbanner() async {
    try {
      var response = await http.get(Uri.parse('${base}banners'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
      // if (response.statusCode == 200) {
      //   APICacheDBModel cacheDBModel =
      //       APICacheDBModel(key: ApiCacheKey.key, syncData: response.body);
      //   await APICacheManager().addCacheData(cacheDBModel);
      //   GetSnackBar(
      //     message: data["message"],
      //   );
      //   return data;
      // }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future addFormData(body) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var response = await http.post(Uri.parse('${base}token'),
          headers: headers, body: jsonEncode(body));
      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'AddForm Data');
      return e;
    }
  }

  // Future getnews() async {
  //   try {
  //     var response = await http.get(Uri.parse('${base}news'));
  //     var data = jsonDecode(response.body);
  //     return data;
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  Future getBranch() async {
    try {
      var response = await http.get(Uri.parse('${base}branch'));
      var data = jsonDecode(response.body);

      return data["data"];
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getevents() async {
    try {
      var response = await http.get(Uri.parse('${base}events'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getabout() async {
    try {
      var response = await http.get(Uri.parse('${base}settings'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("get about$data");
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getGeneralPurchase() async {
    try {
      var response = await http.get(Uri.parse(
          'https://gandakimun.amritsparsha.com/api/document-publicprocurement'));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getImportantLinks() async {
    try {
      var response = await http.get(Uri.parse('${base}importantlink'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAnimalService() async {
    try {
      var response = await http.get(Uri.parse('${base}animalservice'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAmbulance() async {
    try {
      var response = await http.get(Uri.parse('${base}ambulance'));
      log(response.body.toString());
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getTax() async {
    try {
      var response = await http.get(Uri.parse('${base}tax'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getProjectplan() async {
    try {
      var response = await http.get(Uri.parse('${base}projectplan'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getFormview() async {
    try {
      var response = await http.get(Uri.parse('${base}formview'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getSport() async {
    try {
      var response = await http.get(Uri.parse('${base}sportbranch'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMunicipality() async {
    try {
      var response = await http.get(Uri.parse('${base}municipality'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getElectedOfficials() async {
    try {
      var response = await http.get(Uri.parse('${base}electedofficial'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("official is $data");
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getSection() async {
    try {
      var response = await http.get(Uri.parse('${base}section'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  //Suchana adhikari
  // https://gandakimun.amritsparsha.com/api/solarmanagement
  Future getSuchanaAdhikari() async {
    try {
      var response = await http.get(Uri.parse('${base}infomationofficer'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("information offier $data");
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getNotificationServices(String? deviceToken) async {
    var response = await http.get(Uri.parse('${base}noti'));
    print(Uri.parse('${base}noti'));
    var data = jsonDecode(response.body);
    print("notification services $data");
    return data["data"];
  }

  Future getPushNotificationList(String? deviceToken) async {
    var response = await http.get(Uri.parse('${base}push-noti'));
    var data = jsonDecode(response.body);
    print("notification services $data");
    return data["data"];
  }

  Future<void> markAsSeen(String? deviceToken, dynamic notificationID) async {
    try {
      var uri = Uri.parse(
          '${base}noti/is-seen?deviceToken=$deviceToken&notificationID=$notificationID');
      print(uri);
      var response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      print('Request URI: $uri');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("Notification services: $data");
      } else {
        print(
            'Failed to mark notification as seen. Status code: ${response.statusCode}');
        // Handle the error as needed
      }
    } catch (e) {
      print('Error marking notification as seen: $e');
      // Handle the error as needed
    }
  }

  Future getPhones() async {
    try {
      var response = await http.get(Uri.parse('${base}phones'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future postProblemStatement(
    title,
    complaintTypes,
    complainDescription,
    name,
    email,
    img,
    address,
    phone,
    solution,
  ) async {
    try {
      var body = {
        "title": title,
        "complaint_types": complaintTypes,
        "complaint_description": complainDescription,
        "personal_details": "personal details",
        "name": name ?? "--",
        "email": email ?? "--",
        "document1": MultipartFile(img, filename: "pp.jpg").toString(),
        "document2": null,
        "problem_suggestion_type_id": 1,
        "address": address ?? "--",
        "phone": phone ?? "--",
        "date": "2022-1-12",
        "solution": solution
      };
      var response = await http.post(Uri.parse('${base}problemsuggestion'),
          body: body.toString());
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('Post method is working');
        return data;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future postIncidentRegistration(
      complaintName,
      complainantMobileNumber,
      victimName,
      victimAddress,
      victimPhoneNumber,
      incidentAddress,
      incidentNature,
      culpritName,
      culpritAddress,
      culpritPhoneNumber,
      victimColor,
      victimHeight,
      victimClothes,
      victimClothesDolor,
      victimCulpritRelation,
      incidentDetails,
      image) async {
    try {
      var body = {
        "complainant_name": complaintName,
        "complainant_mobile_number": complainantMobileNumber,
        "victim_name": victimName,
        "victim_address": victimAddress,
        "victim_phone_number": victimPhoneNumber,
        "incident_address": incidentAddress,
        "incident_nature": incidentNature,
        "culprit_name": culpritName,
        "culprit_address": culpritAddress,
        "culprit_phone_number": culpritPhoneNumber,
        "victim_color": victimColor,
        "victim_height": victimHeight,
        "victim_clothes": victimClothes,
        "victim_clothes_color": victimClothesDolor,
        "victim_culprit_relation": victimCulpritRelation,
        "incident_details": incidentDetails,
        "image": image
      };
      var response =
          await http.post(Uri.parse('${base}incidentregistration'), body: body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('Post method is working');
        return data;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future postVehileAccidentRegtrataion(
      complaintName,
      complaintMobileNumber,
      date,
      hittingVehicleType,
      hittingVehicleColor,
      hittingVehicleNumber,
      hittedVehicleType,
      hittedVehicleColor,
      hittedVehicleNumber,
      accidentalAddress,
      accidentDescription) async {
    try {
      var body = {
        "complaint_name": complaintName,
        "complaint_mobile_number": complaintMobileNumber,
        "complaint_address": "ktm",
        "date": DateFormat('yyyy-MM-dd').format(date),
        "hitting_vehicle_type": hittingVehicleType,
        "hitting_vehicle_color": hittingVehicleColor,
        "hitting_vehicle_number": hittingVehicleNumber,
        "hitted_vehicle_type": hittedVehicleType,
        "hitted_vehicle_color": hittedVehicleColor,
        "hitted_vehicle_number": hittedVehicleNumber,
        "accidental_address": accidentalAddress,
        "accident_description": accidentDescription
      };
      var response = await http
          .post(Uri.parse('${base}vehile_accident_regtrataion'), body: body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print('Post method is working');
        return data;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  //Notice and information api services starts from here
  Future getNotice() async {
    try {
      var response = await http.get(Uri.parse('${base}notice'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'GetNotice Error');
      print(e);
    }
  }

  Future getNews() async {
    try {
      var response = await http.get(Uri.parse(base));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'GetNotice Error');
      print(e);
    }
  }

  Future getBudget() async {
    try {
      var response =
          await http.get(Uri.parse('${base}document-budgetprogram?id=3'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("budget is $data");
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getLaw() async {
    try {
      var response = await http.get(Uri.parse('${base}reports?id=18 '));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getLawDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}law/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getGazette() async {
    try {
      var response = await http.get(Uri.parse('${base}gazette?id=16'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getKhanda() async {
    try {
      var response = await http.get(Uri.parse('${base}khanda'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getGazetteDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}gazette/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAnnualReport() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=1'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAuditReport() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=3'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMonitoringReport() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=4'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getFinancialStatement() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=2'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getOtherStatement() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=5'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAnnualReportDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}annualreport/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAuditReportDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}auditreport/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMonitoringReportDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}monitoringreport/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getFinancialStatementDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}financialstatement/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getOtherStatementDetails(int id) async {
    try {
      var response = await http.get(Uri.parse('${base}otherstatement/$id'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getSectoralPlan() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=7'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getPeriodicPlan() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=6'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAnnualPlan() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=8'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getSelfPublishing() async {
    try {
      var response = await http.get(Uri.parse('${base}doc-category?id=7'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // Judicials Committee Starts from here

  Future getReconciliation() async {
    try {
      var response = await http.get(Uri.parse('${base}reconciliation'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getListconciliator() async {
    try {
      var response = await http.get(Uri.parse('${base}listconciliator'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getStateConciliator() async {
    try {
      var response = await http.get(Uri.parse('${base}conciliationstatus'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  //Downloads Starts From here
  Future getAinSangalo() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=11'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getImportantForm() async {
    try {
      var response = await http.get(Uri.parse('${base}addform'));
      var data = jsonDecode(response.body);
      print("form data is $data");
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getApplicationForms() async {
    try {
      var response = await http.get(Uri.parse('${base}applicationforms'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getNagarDarrat() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=12'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getBudgetDocument() async {
    try {
      var response = await http.get(Uri.parse('${base}subdoc-category?id=12'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getTransportation() async {
    try {
      var response = await http.get(Uri.parse('${base}transportation'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAgriculture() async {
    try {
      var response = await http.get(Uri.parse('${base}agriculture'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getEduction() async {
    try {
      var response = await http.get(Uri.parse('${base}educationbranch'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getGarbageManagement() async {
    try {
      var response = await http.get(Uri.parse('${base}garbage_management'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getWater() async {
    try {
      var response = await http.get(Uri.parse('${base}khanepani'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getTourism() async {
    try {
      var response = await http.get(Uri.parse('${base}tourism'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getFooterText() async {
    try {
      var response = await http.get(Uri.parse('${base}footer-text'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("footer is $data");
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getDocumentNotice() async {
    try {
      var response = await http.get(Uri.parse('${base}documenttag-notice'));
      log(response.body);
      var data = jsonDecode(response.body);
      return data;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getServiceCategory() async {
    try {
      var response = await http.get(Uri.parse('${base}servicecategory'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getPublicService() async {
    try {
      var response = await http.get(Uri.parse('${base}publicservice'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getOnlineService() async {
    try {
      var response = await http.get(Uri.parse('${base}onlineservice'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getFiscalYear() async {
    try {
      var response = await http.get(Uri.parse('${base}fiscalyear'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getLawType() async {
    try {
      var response = await http.get(Uri.parse('${base}lawtype'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getLawLevel() async {
    try {
      var response = await http.get(Uri.parse('${base}lawlevel'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future searchLaw(law) async {
    try {
      var response = await http.get(Uri.parse('${base}reports/18?title=$law'));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future officeType() async {
    try {
      var response = await http.get(Uri.parse('${base}officetype'));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future serviceGroup() async {
    try {
      var response = await http.get(Uri.parse('${base}service_group'));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future office() async {
    try {
      var response = await http.get(Uri.parse('${base}office'));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["data"];
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
