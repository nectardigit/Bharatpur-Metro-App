import 'dart:developer';

import 'package:get/get.dart';
import 'package:gandakimun/model/civil_ward_paper_model.dart';
import 'package:gandakimun/model/office.dart';
import 'package:gandakimun/model/office_type.dart';
import 'package:gandakimun/services/api_service.dart';

class IntroductionController extends GetxController {
  var officeType = <OfficeTypeHeadingModel>[].obs;
  var office = <OfficeHeadingModel>[].obs;
  var civilWardPaperData = <CivilWardPaperModel>[].obs;
  var loadingOfficeType = false.obs;
  var loadingOffice = false.obs;

  @override
  void onInit() async {
    await fetchOfficeType();
    await fetchOffice();
    await fetchCivilWardPaper();
    super.onInit();
  }

  fetchOfficeType() async {
    loadingOfficeType.value = true;
    try {
      var data = await ApiService().officeType();

      if (data != null) {
        loadingOfficeType.value = false;
        officeType.clear();
         
        data.forEach((v) {
          officeType.add(OfficeTypeHeadingModel.fromJson(v));
        });
      } else {
        loadingOfficeType.value = false;
      }
    } on Exception catch (e) {
      loadingOfficeType.value = false;

      log(e.toString(), name: 'officetype Error');
    } finally {
      loadingOfficeType.value = false;
    }
  }

  fetchOffice() async {
    loadingOffice.value = true;
    try {
      var data = await ApiService().office();

      if (data != null) {
        loadingOffice.value = false;
        office.clear();

        data.forEach((v) {
          office.add(OfficeHeadingModel.fromJson(v));
        });
      } else {}
    } on Exception catch (e) {
      log(e.toString(), name: 'officetype Error');
    } finally {
      loadingOffice.value = false;
    }
  }

  fetchCivilWardPaper() async {
    try {
      var data = await ApiService().getBadaPatra();

      if (data != null) {
        return CivilWardPaperModel.fromJson(data);
      
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchCivilWardPaper error');
    } finally {}
  }



}
