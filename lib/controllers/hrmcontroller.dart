import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gandakimun/database/app_storage.dart';
import 'package:gandakimun/model/field_visit.dart';
import 'package:gandakimun/model/leave.dart';
import 'package:gandakimun/model/profile.dart';
import 'package:gandakimun/model/visit.dart';
import 'package:gandakimun/model/visit_area.dart';
import 'package:gandakimun/model/visit_type.dart';
import 'package:gandakimun/model/visit_vehicle.dart';
import 'package:gandakimun/screens/home/home_screen.dart';
import 'package:gandakimun/screens/login/model/login_send_model.dart';
import 'package:gandakimun/services/hrm_api_service.dart';
import 'package:gandakimun/widget/snackbar.dart';
import 'package:get/get.dart';

import '../model/leave_type.dart';
import '../model/recommender.dart';

class HrmController extends GetxController {
  //login con
  var username = TextEditingController();
  var password = TextEditingController();

  var viewPassword = false.obs;

  RxBool isLoggedin = false.obs;
  RxBool isHalfday = false.obs;

  var loading = false.obs;

  //leaveType
  var leaveTypeList = <LeaveType>[].obs;
  var recommenderList = <Recommender>[].obs;
  var visitAreaList = <VisitArea>[].obs;
  var visitTypeList = <VisitType>[].obs;
  var visitVehicleList = <VisitVehicle>[].obs;
  var leaveList = <Leave>[].obs;
  var visitList = <Visit>[].obs;
  var fieldvisitList = <FieldVisit>[].obs;

  @override
  void onInit() {
    // username.text = "niraj";
    // password.text = "P@\$\$123";
    fetchAll();
    isLoggedin.value = AppStorage.readIsLoggedIn ?? false;
    super.onInit();
  }

  fetchAll() {
    fetchLeaveType();
    fetchRecommender();
    fetchVisitArea();
    fetchVisitType();
    fetchVisitVehicle();
    fetchLeave();
    fetchVisit();
    fetchFieldVisit();
    fetchProfile();
  }

  setloginValuefalse() {
    isLoggedin(false);
    update();
  }

  setloginValueTrue() {
    isLoggedin(true);
    update();
  }

  login() async {
    LoginDataModel loginDataModel =
        LoginDataModel(username: username.text, password: password.text);
    var data = await HrmApi().login(loginDataModel);

    if (data != null) {
      if (data['token'] != null) {
        AppStorage.saveAccessToken(data['token']);
        AppStorage.saveIsLoggedin(true);
        setloginValueTrue();
        Get.to(const HomeScreen());

        getSnackbar(message: 'Logged In Successfull', bgColor: Colors.green);
        username.clear();
        password.clear();
      } else if (data["message"] != null) {
        getSnackbar(message: data['message'], bgColor: Colors.red);
      }
    } else {
      getSnackbar(message: 'Error while logging in', bgColor: Colors.red);
    }
  }

  fetchLeaveType() async {
    loading(true);
    var data = await HrmApi().leaveTypes(AppStorage.readAccessToken.toString());
    if (data != null) {
      loading(false);

      leaveTypeList.clear();
      data.forEach((v) => leaveTypeList.add(LeaveType.fromJson(v)));
    }
  }

  fetchLeave() async {
    // loading(true);
    var data = await HrmApi().getLeave(AppStorage.readAccessToken.toString());
    log(data.toString());
    if (data != null) {
      // loading(false);

      leaveList.clear();
      data.forEach((v) => leaveList.add(Leave.fromJson(v)));
    }
  }

  fetchVisit() async {
    // loading(true);
    var data = await HrmApi().getVisit(AppStorage.readAccessToken.toString());
    log(data.toString());
    if (data != null) {
      // loading(false);

      visitList.clear();
      data.forEach((v) => visitList.add(Visit.fromJson(v)));
    }
  }

  fetchFieldVisit() async {
    // loading(true);
    var data =
        await HrmApi().getFieldVisit(AppStorage.readAccessToken.toString());
    log(data.toString());
    if (data != null) {
      // loading(false);

      fieldvisitList.clear();
      data.forEach((v) => fieldvisitList.add(FieldVisit.fromJson(v)));
    }
  }

  fetchRecommender() async {
    loading(true);

    var data =
        await HrmApi().getRecommender(AppStorage.readAccessToken.toString());
    if (data != null) {
      loading(false);

      recommenderList.clear();
      data.forEach((v) => recommenderList.add(Recommender.fromJson(v)));
    }
  }

  applyForLeave(int leaveId, remarks, fromDate, toDate, bool halfday,
      int recommendBy) async {
    var data =
        await HrmApi().applyLeave(AppStorage.readAccessToken.toString(), {
      "leaveTypeId": leaveId,
      "remarks": remarks,
      "dateFrom": fromDate,
      "dateTo": toDate,
      "isHalfDay": halfday,
      "recommendBy": recommendBy
    });
    log(fromDate);
    if (data != null) {
      loading(false);
      if (data['responseCode'] == "000") {
        Get.back();
        getSnackbar(message: data["message"]);
      }
    }
  }

  fetchVisitArea() async {
    loading(true);

    var data =
        await HrmApi().getVisitArea(AppStorage.readAccessToken.toString());
    if (data != null) {
      loading(false);
      visitAreaList.clear();
      data.forEach((v) => visitAreaList.add(VisitArea.fromJson(v)));
    }
  }

  fetchVisitType() async {
    loading(true);

    var data =
        await HrmApi().getVisitType(AppStorage.readAccessToken.toString());
    if (data != null) {
      loading(false);

      visitTypeList.clear();
      data.forEach((v) => visitTypeList.add(VisitType.fromJson(v)));
    }
  }

  fetchVisitVehicle() async {
    loading(true);

    var data =
        await HrmApi().getVisitVehicle(AppStorage.readAccessToken.toString());
    if (data != null) {
      visitVehicleList.clear();
      data.forEach((v) => visitVehicleList.add(VisitVehicle.fromJson(v)));
    }
  }

  applyForVisit(visitarea, int visitType, int visitVehicle, visitPlace,
      dateFrom, dateTo, remarks, int recommendBy) async {
    var data =
        await HrmApi().applyVisit(AppStorage.readAccessToken.toString(), {
      "visitArea": visitarea,
      "visitType": visitType,
      "visitVehicle": visitVehicle,
      "visitPlace": visitPlace,
      "dateFrom": dateFrom,
      "dateTo": dateTo,
      "remarks": remarks,
      "recommendBy": recommendBy
    });
    log(data);

    if (data != null) {
      if (data['responseCode'] == "000") {
        Get.back();
        getSnackbar(message: data["message"]);
      }
    }
  }

  applyForField(
      fieldVisitDate, timeFrom, timeTo, remarks, int recommendBy) async {
    var data =
        await HrmApi().applyFieldVisit(AppStorage.readAccessToken.toString(), {
      "fieldVisitDate": fieldVisitDate,
      "timeFrom": timeFrom,
      "timeTo": timeTo,
      "remarks": remarks,
      "recommendBy": recommendBy
    });
    getSnackbar(message: data.toString());
    if (data != null) {
      if (data['responseCode'] == "000") {
        log("sads$data");

        getSnackbar(message: data["message"]);
        Get.back();
      }
    }
  }

  //userProfile

  var userProfile = Profile().obs;

  fetchProfile() async {
    // loading(true);
    var data = await HrmApi().getProfile(AppStorage.readAccessToken.toString());
    // print(data.toString());
    if (data != null) {
      // loading(false);
      userProfile.value = Profile.fromJson(data);
    }
  }
}
