import 'dart:developer';

import 'package:get/get.dart';
import 'package:gandakimun/model/cityScapeModel.dart';
import 'package:gandakimun/model/civil_ward_paper_model.dart';
import 'package:gandakimun/model/intro.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/model/officer_details_model.dart';
import 'package:gandakimun/model/organization_structure_model.dart';
import 'package:gandakimun/model/services.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/model/wards.dart';
import 'package:gandakimun/services/api_service.dart';

class OurInformationController extends GetxController implements GetxService {
  var jobDescriptionList = <JobDescriptionHeaderModel>[].obs;
  var officerDetailsList = <OfficerDetailsData>[].obs;
  var cityScapeList = <CityScapeHeadingModel>[].obs;
  var introlist = <IntroData>[].obs;
  var loadingIntro = false.obs;

  var organizationStructureList = <OrganizationStructureData>[].obs;
  var teamlist = <TeamData>[].obs;
  var wardlist = <WardHeadingModel>[].obs;
  var serviceslist = <ServicesData>[].obs;
  var loadingWards = false.obs;
  var loadingOrganization = false.obs;

  @override
  void onInit() {
    initializers();
    super.onInit();
  }

  initializers() async {
    await fetchIntro();
    await fetchOrganizationStructure();
    // fetchWards();
    fetchTeams();
    // fetchJobDescription();
    fetchServices();
    fetchOfficerDetails();
    fetchOrganizationStructure();
    fetchCityScape();
  }

  fetchIntro() async {
    try {
      loadingIntro.value = true;
      var data = await ApiService().getIntro();
      if (data != null) {
        await Future.delayed(const Duration(seconds: 2));
        loadingIntro.value = false;
        introlist.clear();
        data.forEach((v) {
          introlist.add(IntroData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchIntro error');
    } finally {
      loadingIntro.value = false;
    }
  }

  fetchTeams() async {
    try {
      var data = await ApiService().getteams();
      teamlist.refresh();
      if (data != null) {
        teamlist.clear();
        data.forEach((v) {
          teamlist.add(TeamData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchTeams error');
    }
  }

  // fetchJobDescription() async {
  //   try {
  //     var data = await ApiService().getJobDescrpition();
  //     if (data != null) {
  //       jobDescriptionList.clear();
  //       data.forEach((v) {
  //         jobDescriptionList.add(JobDescriptionHeaderModel.fromJson(v));
  //       });
  //     }
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'fetchJobDescription Error');
  //   }
  // }

  fetchWards() async {
    try {
      loadingWards.value = true;
      var data = await ApiService().getWards();
      log("Wards is $data");
      if (data != null) {
        // await Future.delayed(const Duration(milliseconds: 500));
        log("Mukunda Dhungana");
        loadingWards.value = false;
        wardlist.clear();
        data.forEach((v) {
          wardlist.add(WardHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loadingWards.value = false;
      log(e.toString(), name: 'fetch wards error');
    } finally {
      loadingWards.value = false;
    }
  }

  fetchServices() async {
    try {
      var data = await ApiService().getServices();
      print("Service $data");
      if (data != null) {
        serviceslist.clear();
        data.forEach((v) {
          serviceslist.add(ServicesData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchServices error ');
    }
  }

  fetchOfficerDetails() async {
    try {
      var data = await ApiService().getOfficerDetails();
      if (data != null) {
        officerDetailsList.clear();
        data.forEach((v) {
          officerDetailsList.add(OfficerDetailsData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchOfficerDetails error');
    }
  }

  fetchOrganizationStructure() async {
    try {
      loadingOrganization.value = true;
      var data = await ApiService().getOrganizationStructure();
      if (data != null) {
        loadingOrganization.value = false;
        organizationStructureList.clear();
        data.forEach((v) {
          organizationStructureList.add(OrganizationStructureData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchOrganizationStructure Error');
    } finally {
      loadingOrganization.value = false;
    }
  }

  fetchCityScape() async {
    try {
      var data = await ApiService().getCityScape();
      if (data != null) {
        cityScapeList.clear();
        data.forEach((v) {
          cityScapeList.add(CityScapeHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchCityScape error');
    }
  }
}
