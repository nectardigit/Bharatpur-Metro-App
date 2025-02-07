import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gandakimun/model/about.dart';
import 'package:gandakimun/model/agriculture_model.dart';
import 'package:gandakimun/model/ain_sangalo.dart';
import 'package:gandakimun/model/ambulance.dart';
import 'package:gandakimun/model/animal_service.dart';
import 'package:gandakimun/model/application_form_model.dart';
import 'package:gandakimun/model/banner.dart';
import 'package:gandakimun/model/branch.dart';
import 'package:gandakimun/model/budget.dart';
import 'package:gandakimun/model/cityScapeModel.dart';
import 'package:gandakimun/model/contact_info_officer.dart';
import 'package:gandakimun/model/document_notice.dart';
import 'package:gandakimun/model/education.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/model/events.dart';
import 'package:gandakimun/model/fiscal_year.dart';
import 'package:gandakimun/model/footer_text.dart';
import 'package:gandakimun/model/formview.dart';
import 'package:gandakimun/model/garbage_management_model.dart';
import 'package:gandakimun/model/gazette_details_model.dart';
import 'package:gandakimun/model/gazette_model.dart';
import 'package:gandakimun/model/general_purchase.dart';
import 'package:gandakimun/model/health.dart';
import 'package:gandakimun/model/important_links.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/model/khanda.dart';
import 'package:gandakimun/model/law.dart';
import 'package:gandakimun/model/lawDetails.dart';
import 'package:gandakimun/model/law_type.dart';
import 'package:gandakimun/model/list_of_reconcilatotors.dart';
import 'package:gandakimun/model/municipality.dart';

import 'package:gandakimun/model/periodic_plan_model.dart';
import 'package:gandakimun/model/phones.dart';
import 'package:gandakimun/model/projectplan.dart';
import 'package:gandakimun/model/public_service.dart';
import 'package:gandakimun/model/reconciliation_model.dart';
import 'package:gandakimun/model/reports_model.dart';
import 'package:gandakimun/model/section.dart';
import 'package:gandakimun/model/self_publishing_model.dart';
import 'package:gandakimun/model/service_category.dart';
import 'package:gandakimun/model/service_group.dart';
import 'package:gandakimun/model/sport.dart';
import 'package:gandakimun/model/state_of_reconcilators.dart';
import 'package:gandakimun/model/suchana_adhikari.dart';
import 'package:gandakimun/model/tax.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/model/tourism_model.dart';
import 'package:gandakimun/model/transportation_model.dart';
import 'package:gandakimun/model/water_model.dart';
import 'package:gandakimun/screens/dashboard_navigator.dart';
import 'package:gandakimun/services/api_service.dart';
import 'package:gandakimun/widget/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../constants.dart';
import '../model/form.dart';
import '../model/online_services.dart';

class AppController extends GetxController implements GetxService {
  final box = GetStorage();
  bool isVisible = true;
  var readmore = false.obs;
  var loading = false.obs;
  var loadingServiceCategory = false.obs;
  var isNepali = true.obs;
  var internet = false.obs;

  var loadingNotice = true.obs;
  var loadingPlans = false.obs;

  var info = TextEditingController();
  var name = TextEditingController();

  var eventlist = <EventsData>[].obs;
  var bannerList = <BannerData>[].obs;

  var aboutlist = <AboutData>[].obs;

  // var generalPurchaseList = <GeneralPurposeHeadingModel>[].obs;

  var healthlist = <HealthData>[].obs;

  var importantLinklist = <ImportantLinkData>[].obs;
  var animalServicelist = <AnimalServiceData>[].obs;
  var ambulancelist = <AmbulanceData>[].obs;
  var educationlist = <EducationData>[].obs;
  var projectplanlist = <ProjectplanData>[].obs;
  var taxlist = <TaxData>[].obs;

  var formviewlist = <FormviewData>[].obs;
  var sportlist = <SportData>[].obs;

  var municipalitylist = <MunicipalityData>[].obs;
  var sectionlist = <SectionData>[].obs;
  var phoneslist = <PhoneData>[].obs;

  var branchList = <BranchData>[].obs;

  //Notice and information List
  var noticeList = <NoticeHeadingModel>[].obs;
  var budgetlist = <BudgetData>[].obs;
  var lawlist = <LawData>[].obs;
  var lawDetailslist = <LawDetailsData>[].obs;
  var gazetteList = <GazetteHeadingModel>[].obs;
  var khandaList = <KhandaData>[].obs;
  var gazetteDetailsList = <GezetteDetailsData>[].obs;

  //Report List
  var annualReportsList = <ReportHeadingModel>[].obs;
  var auditReportDataList = <ReportHeadingModel>[].obs;
  var monitoringReportDataList = <ReportHeadingModel>[].obs;
  var financialStatementDataList = <ReportHeadingModel>[].obs;
  var otherReportDataList = <ReportHeadingModel>[].obs;

  //Report Details
  var annualReportsDetailsList = <ReportHeadingModel>[].obs;
  var auditReportDataDetailsList = <ReportHeadingModel>[].obs;
  var monitoringReportDataDetailsList = <ReportHeadingModel>[].obs;
  var financialStatementDataDetailsList = <ReportHeadingModel>[].obs;
  var otherReportDataDetailsList = <ReportHeadingModel>[].obs;
  var annualPlanList = <PlanCategoryHeadingModel>[].obs;
  var periodicPlanList = <PlanCategoryHeadingModel>[].obs;
  var sectoralPlanList = <PlanCategoryHeadingModel>[].obs;
  var selfPublishingList = <SelfPublishingHeadingModel>[].obs;

  //Conciliators
  var reconciliationList = <ReconciliationData>[].obs;
  var listOfConciliatorsList = <ListOfReconciliatorHeaderModel>[].obs;
  var stateOfConciliatorsList = <StateReconciliatorHeaderModel>[].obs;

//Download page List starts from here
  var ainSangaloList = <AniSangaloHeadingModel>[].obs;
  var applicationFormList = <ApplicationFormData>[].obs;
  var importantFormList = <DownloadFormData>[].obs;
  var nagarDarratList = <AniSangaloHeadingModel>[].obs;
  var budgetDocumentList = <AniSangaloHeadingModel>[].obs;
  var generalPurchaseList = <GeneralServiceHeadingModel>[].obs;
  var loadingGeneralPurchaseList = false.obs;

  //Public Services starts
  var transporationList = <TransportationData>[].obs;
  var agricultureList = <AgricultureData>[].obs;
  var garbageManagementList = <GarbageManagementData>[].obs;
  var waterList = <WaterData>[].obs;
  var tourismList = <TourismData>[].obs;
  var footerTextList = <FooterHeadingModel>[].obs;
  var documentNoticeList = <NoticeHeadingModel>[].obs;
  var contactInformation = <ContactHeadingInfoModel>[].obs;

  var serviceCategory = <ServiceCategoryHeadingModel>[].obs;
  var publicService = <PublicSericeHeadingModel>[].obs;

  var onlineService = <OnlineServicesData>[].obs;
  var cityScapeList = <CityScapeHeadingModel>[].obs;

  var jobDescriptionList = <JobDescriptionHeaderModel>[].obs;

  var loadings = false.obs;
  var loadingDashboard = false.obs;

  var loadingPublicService = false.obs;
  var loadingCarousel = false.obs;

  var fiscalYearList = <FiscalYearHeadingModel>[].obs;
  var loadingFiscalYear = false.obs;
  var lawtypeList = <LawTypeHeading>[].obs;
  var lawlevelList = <LawTypeHeading>[].obs;
  var searchLaws = <LawData>[].obs;
  RxList<LawData> articles = RxList();
  var searchLoading = false.obs;
  TextEditingController searchtxt = TextEditingController();

  var serviceGroup = <ServiceGroupHeadingModel>[].obs;
  RxList<ElectedOfficalsData> electedOffical = <ElectedOfficalsData>[].obs;
  var teamlist = <TeamData>[].obs;
  var informationOfficer = <SuchanaAdhikariData>[].obs;
  var electedLoading = false.obs;

  @override
  void onInit() {
    fetchTeams();
    fetchBudgets();
    fetchImportantLinks();
    checkInternet();
    fetchBanner();
    fetchElectedOffical();
    fetchAbout();
    fetchOfficeContact();
    getServiceCategory();
    getPublicService();
    getOnlineService();
    fetchFiscalYear();
    fetchProjectplan();
    //Report
    getOtherStatement();
    getFinancialStatement();
    getMonitoringReport();
    getAuditReport();
    getAnnualReport();
    getSelfPublishing();
    //Conciliators
    getReconciliations();
    getListOfReconciliators();
    getStateOfReconciliators();
    //Downloads starts from here
    getImportantForm();
    getAinSangalo();
    getApplicationForms();
    getNagarDarrat();
    getBudgetDocument();
    //Public Services starts
    getTransportation();
    getAgriculture();
    getGarbageManagement();
    getWater();
    getTourism();
    getServiceCategory();
    getPublicService();
    getOnlineService();
    fetchCityScape();
    fetchJobDescription();
    super.onInit();
  }

  initializer() async {
    getPublicService();
    loadingDashboard.value = true;
    await fetchJobDescription();
    fetchEvents();
    fetchAbout();
    fetchLawType();
    fetchHealth();
    searchLaw();
    fetchImportantLinks();
    fetchAnimalService();
    fetchEducation();
    fetchProjectplan();
    fetchTax();
    fetchFormview();
    fetchSport();
    fetchMunicipality();
    fetchSection();
    fetchPhones();
    checkInternet();
    // addFormData();
    fetchBranch();
    fetchAmbulance();
    getServiceCategory();
    getPublicService();
    getOnlineService();
    fetchCityScape();
    fetchElectedOffical();
    fetchFiscalYear();
    getSelfPublishing();
    fetchServiceGroup();
    getImportantForm();
    getAinSangalo();
    getApplicationForms();
    getNagarDarrat();
    getBudgetDocument();
    // fetchgeneralPurchaseList();
  }

  @override
  void refresh() {
    Get.offAll(const DashboardPage());
  }

  checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    internet.value = result;
    if (result == true) {
    } else {
      getSnackbar(bgColor: AppColor.red, message: "No internet connection");
    }
  }

  Future fetchBanner() async {
    loadingDashboard.value = false;
    try {
      loadingCarousel.value = true;
      var data = await ApiService().getbanner();
      bannerList.clear();
      if (data != null) {
        await fetchNotice();
        // await Future.delayed(const Duration(milliseconds: 500));
        loadingCarousel.value = false;
        data.forEach((v) {
          bannerList.add(BannerData.fromJson(v));
        });
        await fetchElectedOffical();
      }
    } on Exception catch (e) {
      loadingCarousel.value = false;
      log(e.toString(), name: 'fetchEvents error');
    } finally {
      loadingCarousel.value = false;
    }
  }

  void show() {
    if (!isVisible) {
      isVisible = true;
    }
  }

  void hide() {
    if (isVisible) {
      isVisible = false;
    }
  }

  fetchEvents() async {
    try {
      var data = await ApiService().getevents();
      eventlist.clear();
      if (data != null) {
        data.forEach((v) {
          eventlist.add(EventsData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchEvents error');
    }
  }

  fetchAbout() async {
    try {
      var data = await ApiService().getabout();
      if (data != null) {
        data.forEach((v) {
          aboutlist.add(AboutData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchAbout error');
    }
  }

  fetchgeneralPurchaseList() async {
    try {
      loadingGeneralPurchaseList.value = true;
      var data = await ApiService().getGeneralPurchase();
      log(' the final api $data');
      if (data != null) {
        loadingGeneralPurchaseList.value = false;
        generalPurchaseList.clear();
        data.forEach((v) {
          generalPurchaseList.add(GeneralServiceHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchgeneralPurchaseList error');
    } finally {
      loadingGeneralPurchaseList.value = false;
    }
  }

  fetchHealth() async {
    try {
      loading.value = true;
      var data = await ApiService().getHealth();
      // print("data is here " + data.toString());
      if (data != null) {
        healthlist.clear();
        Future.delayed(const Duration(seconds: 2));
        loading.value = false;
        data.forEach((v) {
          healthlist.add(HealthData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchHealth error');
    } finally {
      loading(false);
    }
  }

  fetchImportantLinks() async {
    try {
      loading(true);
      var data = await ApiService().getImportantLinks();
      // print("important links " + data.toString());
      if (data != null) {
        importantLinklist.clear();
        loading(false);
        data.forEach((v) {
          importantLinklist.add(ImportantLinkData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchImportantLinks error');
    }
  }

  fetchAnimalService() async {
    try {
      loading(true);
      var data = await ApiService().getAnimalService();
      if (data != null) {
        animalServicelist.clear();
        loading(false);
        data.forEach((v) {
          animalServicelist.add(AnimalServiceData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchAnimalService error');
    }
  }

  fetchAmbulance() async {
    try {
      loading(true);
      var data = await ApiService().getAmbulance();
      if (data != null) {
        ambulancelist.clear();
        loading(false);
        data.forEach((v) {
          ambulancelist.add(AmbulanceData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchAmbulance Error');
    }
  }

  fetchEducation() async {
    try {
      loading(true);
      var data = await ApiService().getEduction();
      if (data != null) {
        educationlist.clear();
        loading(false);
        data.forEach((v) {
          educationlist.add(EducationData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      //
      loading(false);
      log(e.toString(), name: 'fetch education error');
    }
  }

  fetchProjectplan() async {
    try {
      loading(true);
      var data = await ApiService().getProjectplan();
      log("Project plan $data");
      if (data != null) {
        projectplanlist.clear();
        loading(false);
        data.forEach((v) {
          projectplanlist.add(ProjectplanData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: ' Fetch projectplan error');
    }
  }

  fetchTax() async {
    try {
      loading(true);
      var data = await ApiService().getTax();
      if (data != null) {
        taxlist.clear();
        loading(false);
        data.forEach((v) {
          taxlist.add(TaxData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchTax error');
    }
  }

  fetchFormview() async {
    try {
      loading(true);
      var data = await ApiService().getFormview();
      if (data != null) {
        formviewlist.clear();
        loading(false);
        data.forEach((v) {
          formviewlist.add(FormviewData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchFormview error');
    }
  }

  fetchSport() async {
    try {
      loading(true);
      var data = await ApiService().getSport();
      log("Sport $data");
      if (data != null) {
        sportlist.clear();
        loading(false);
        data.forEach((v) {
          sportlist.add(SportData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetch Sports error');
    }
  }

  fetchMunicipality() async {
    try {
      loading(true);
      var data = await ApiService().getMunicipality();
      log("Municipality $data");
      if (data != null) {
        municipalitylist.clear();
        loading(false);
        data.forEach((v) {
          municipalitylist.add(MunicipalityData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchMunicipality error');
    }
  }

  fetchSection() async {
    try {
      loading(true);
      var data = await ApiService().getSection();
      if (data != null) {
        sectionlist.clear();
        loading(false);
        data.forEach((v) {
          sectionlist.add(SectionData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchSection error');
    }
  }

  fetchPhones() async {
    try {
      loading(true);
      var data = await ApiService().getPhones();
      if (data != null) {
        phoneslist.clear();
        loading(false);
        data.forEach((v) {
          phoneslist.add(PhoneData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchPhones error');
    }
  }

  fetchBranch() async {
    try {
      loading(true);
      var data = await ApiService().getBranch();
      if (data != null) {
        branchList.clear();
        loading(false);
        data.forEach((v) {
          branchList.add(BranchData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchBranch error');
    }
  }

  postProblemStatement(
    title,
    complaintTypes,
    complaintDescription,
    name,
    email,
    img,
    address,
    phone,
    solution,
  ) async {
    try {
      loading(true);
      var data = await ApiService().postProblemStatement(
        title,
        complaintTypes,
        complaintDescription,
        name,
        email,
        img,
        address,
        phone,
        solution,
      );
      if (data != null) {
        getSnackbar(message: 'दर्ता सफल');
        loading(false);
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'postProblemStatement error');
    }
  }

  postIncidentRegistrationDetails(
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
      victimClothesColor,
      victimCulpritRelation,
      incidentDetails,
      image) async {
    try {
      loading(true);
      var data = await ApiService().postIncidentRegistration(
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
          victimClothesColor,
          victimCulpritRelation,
          incidentDetails,
          image);

      if (data != null) {
        getSnackbar(message: "दर्ता सफल");

        loading(false);
      }
    } on Exception catch (e) {
      getSnackbar(bgColor: AppColor.red, message: 'Error Occured');
      loading(false);
      log(e.toString(), name: 'postIncidentRegistrationDetails error');
    }
  }

  postVehicleAccidentRegistration(
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
      loading(true);
      var data = await ApiService().postVehileAccidentRegtrataion(
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
          accidentDescription);

      if (data != null) {
        getSnackbar(message: "दर्ता सफल");
        loading(false);
      }
    } on Exception catch (e) {
      getSnackbar(bgColor: AppColor.red, message: 'Error Occured');
      loading(false);
      log(e.toString(), name: 'postVehicleAccidentRegistration');
    }
  }

  //NOTICE AND INFORMATION API STARTS FROM HERE
  fetchNotice() async {
    try {
      // loadingNotice.value = false;
      var data = await ApiService().getNotice();
      if (data != null) {
        loadingNotice.value = false;
        // await fetchBanner();
        noticeList.clear();
        data.forEach((v) {
          noticeList.add(NoticeHeadingModel.fromJson(v));
        });
      } else {
        loadingNotice.value = false;
      }
    } catch (e) {
      loadingNotice.value = false;
      log(e.toString(), name: 'fetchNotice Error');
    } finally {
      loadingNotice.value = false;
    }
    update();
  }

  fetchBudgets() async {
    try {
      var data = await ApiService().getBudget();
      if (data != null) {
        budgetlist.clear();
        data.forEach((v) {
          budgetlist.add(BudgetData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchBudgets Error');
    }
  }

  fetchLaw() async {
    try {
      // loading(true);
      var data = await ApiService().getLaw();
      if (data != null) {
        lawlist.clear();

        // loading(false);
        data.forEach((v) {
          lawlist.add(LawData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetch law Error');
    }
  }

  getLawDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getLawDetails(id);
      if (data != null) {
        lawDetailslist.clear();

        loading(false);
        data.forEach((v) {
          lawDetailslist.add(LawDetailsData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getLawDetails Error');
    }
  }

  fetchGezette() async {
    try {
      loading.value = true;
      var data = await ApiService().getGazette();
      if (data != null) {
        gazetteList.clear();
        loading.value = false;
        data.forEach((v) {
          gazetteList.add(GazetteHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading.value = false;
      log(e.toString(), name: 'fetchGazette Error');
    } finally {
      loading.value = false;
    }
  }

  fetchKhanda() async {
    try {
      loading.value = true;
      var data = await ApiService().getKhanda();
      // print("data is here " + data.toString());
      if (data != null) {
        khandaList.clear();
        loading.value = false;
        data.forEach((v) {
          khandaList.add(KhandaData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading.value = false;
      log(e.toString(), name: 'fetchGazette Error');
    } finally {
      loading.value = false;
    }
  }

  getGezetteDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getGazetteDetails(id);
      // print("data is here " + data.toString());
      if (data != null) {
        gazetteDetailsList.clear();

        loading(false);
        data.forEach((v) {
          gazetteDetailsList.add(GezetteDetailsData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'fetchGazette Details Error');
    }
  }

  getOtherStatement() async {
    try {
      loading(true);
      var data = await ApiService().getOtherStatement();
      // print("data is here " + data.toString());
      if (data != null) {
        otherReportDataList.clear();

        loading(false);
        data.forEach((v) {
          otherReportDataList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getOtherStatement Error');
    }
  }

  getFinancialStatement() async {
    try {
      loading(true);
      var data = await ApiService().getFinancialStatement();
      // print("data is here " + data.toString());
      if (data != null) {
        financialStatementDataList.clear();

        loading(false);
        data.forEach((v) {
          financialStatementDataList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getFinancialStatement Error');
    }
  }

  getMonitoringReport() async {
    try {
      loading(true);
      var data = await ApiService().getMonitoringReport();
      // print("data is here " + data.toString());
      if (data != null) {
        monitoringReportDataList.clear();

        loading(false);
        data.forEach((v) {
          monitoringReportDataList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getMonitoringReport Error');
    }
  }

  getAuditReport() async {
    try {
      loading(true);
      var data = await ApiService().getAuditReport();
      // print("data is here " + data.toString());
      if (data != null) {
        auditReportDataList.clear();

        loading(false);
        data.forEach((v) {
          auditReportDataList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAuditReport Error');
    }
  }

  getAnnualReport() async {
    try {
      loading(true);
      var data = await ApiService().getAnnualReport();
      // print("data is here " + data.toString());
      if (data != null) {
        annualReportsList.clear();

        loading(false);
        data.forEach((v) {
          annualReportsList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAnnualReport Error');
    }
  }

  getOtherStatementDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getOtherStatementDetails(id);
      // print("data is here " + data.toString());
      if (data != null) {
        otherReportDataDetailsList.clear();

        loading(false);
        data.forEach((v) {
          otherReportDataDetailsList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getOtherStatementDetails Error');
    }
  }

  getFinancialStatementDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getFinancialStatementDetails(id);
      // print("data is here " + data.toString());
      if (data != null) {
        financialStatementDataDetailsList.clear();

        loading(false);
        data.forEach((v) {
          financialStatementDataDetailsList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getFinancialStatementDetails Error');
    }
  }

  getMonitoringReportDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getMonitoringReportDetails(id);
      // print("data is here " + data.toString());
      if (data != null) {
        monitoringReportDataDetailsList.clear();

        loading(false);
        data.forEach((v) {
          monitoringReportDataDetailsList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getMonitoringReportDetails Error');
    }
  }

  getAuditReportDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getAuditReportDetails(id);
      // print("data is here " + data.toString());
      if (data != null) {
        auditReportDataDetailsList.clear();

        loading(false);
        data.forEach((v) {
          auditReportDataDetailsList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAuditReportDetails Error');
    }
  }

  getAnnualReportDetails(int id) async {
    try {
      loading(true);
      var data = await ApiService().getAnnualReportDetails(id);
      // print("data is here " + data.toString());
      if (data != null) {
        annualReportsDetailsList.clear();

        loading(false);
        data.forEach((v) {
          annualReportsDetailsList.add(ReportHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAnnualReportDetails Error');
    }
  }

  getAnnualPlan() async {
    try {
      loading(true);
      var data = await ApiService().getAnnualPlan();
      // print("data is here " + data.toString());
      if (data != null) {
        annualPlanList.clear();

        loading(false);
        data.forEach((v) {
          annualPlanList.add(PlanCategoryHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAnnualPlan Error');
    }
  }

  getPeriodicPlan() async {
    try {
      loadingPlans.value = true;
      var data = await ApiService().getPeriodicPlan();
      // print("data is here " + data.toString());
      if (data != null) {
        periodicPlanList.clear();
        loadingPlans.value = false;
        data.forEach((v) {
          periodicPlanList.add(PlanCategoryHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loadingPlans.value = false;
      log(e.toString(), name: 'getPeriodicPlan Error');
    } finally {
      loadingPlans.value = false;
    }
  }

  getSectoralPlan() async {
    try {
      loadingPlans.value = true;
      var data = await ApiService().getSectoralPlan();
      print("data is here " + data.toString());
      if (data != null) {
        log("Mukunda inside sector");
        sectoralPlanList.clear();
        loadingPlans.value = false;
        data.forEach((v) {
          sectoralPlanList.add(PlanCategoryHeadingModel.fromJson(v));
        });
      } else {
        loadingPlans.value = false;
      }
    } on Exception catch (e) {
      loading.value = false;
      log(e.toString(), name: 'getSectoralPlan Error');
    } finally {
      loadingPlans.value = false;
    }
  }

  getSelfPublishing() async {
    try {
      loadingPlans.value = true;
      var data = await ApiService().getSelfPublishing();
      // print("data is here " + data.toString());
      if (data != null) {
        selfPublishingList.clear();

        loadingPlans.value = false;
        data.forEach((v) {
          selfPublishingList.add(SelfPublishingHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loadingPlans.value = false;
      log(e.toString(), name: 'getSelfPublishing Error');
    } finally {
      loadingPlans.value = false;
    }
  }

  getReconciliations() async {
    try {
      loading(true);
      var data = await ApiService().getReconciliation();
      // print("data is here " + data.toString());
      if (data != null) {
        reconciliationList.clear();

        loading(false);
        data.forEach((v) {
          reconciliationList.add(ReconciliationData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getReconciliations Error');
    }
  }

  getListOfReconciliators() async {
    try {
      loading(true);
      var data = await ApiService().getListconciliator();
      // print("data is here " + data.toString());
      if (data != null) {
        listOfConciliatorsList.clear();

        loading(false);
        data.forEach((v) {
          listOfConciliatorsList
              .add(ListOfReconciliatorHeaderModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getListOfReconciliators Error');
    }
  }

  getStateOfReconciliators() async {
    try {
      loading(true);
      var data = await ApiService().getStateConciliator();
      // print("data is here " + data.toString());
      if (data != null) {
        stateOfConciliatorsList.clear();

        loading(false);
        data.forEach((v) {
          stateOfConciliatorsList
              .add(StateReconciliatorHeaderModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getStateOfReconciliators Error');
    }
  }

// Donwload Starts from here
  getAinSangalo() async {
    try {
      loading(true);
      var data = await ApiService().getAinSangalo();
      // print("data is here " + data.toString());
      if (data != null) {
        ainSangaloList.clear();

        loading(false);
        data.forEach((v) {
          ainSangaloList.add(AniSangaloHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAinSangalo Error');
    }
  }

  getImportantForm() async {
    try {
      loading(true);
      var data = await ApiService().getImportantForm();
      // print("data is here " + data.toString());
      if (data != null) {
        importantFormList.clear();

        loading(false);
        data.forEach((v) {
          importantFormList.add(DownloadFormData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getImportForm Error');
    }
  }

  getApplicationForms() async {
    try {
      loading(true);
      var data = await ApiService().getApplicationForms();
      // print("data is here " + data.toString());
      if (data != null) {
        applicationFormList.clear();

        loading(false);
        data.forEach((v) {
          applicationFormList.add(ApplicationFormData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getApplicationForms Error');
    }
  }

  getNagarDarrat() async {
    try {
      loading(true);
      var data = await ApiService().getNagarDarrat();
      // print("data is here " + data.toString());
      if (data != null) {
        nagarDarratList.clear();

        loading(false);
        data.forEach((v) {
          nagarDarratList.add(AniSangaloHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      print(e);
    }
  }

  getBudgetDocument() async {
    try {
      loading(true);
      var data = await ApiService().getBudgetDocument();
      // print("data is here " + data.toString());
      if (data != null) {
        budgetDocumentList.clear();

        loading(false);
        data.forEach((v) {
          budgetDocumentList.add(AniSangaloHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      print(e);
    }
  }

  getTransportation() async {
    try {
      loading(true);
      var data = await ApiService().getTransportation();
      // print("data is here " + data.toString());
      if (data != null) {
        transporationList.clear();

        loading(false);
        data.forEach((v) {
          transporationList.add(TransportationData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      print(e);
    }
  }

  getAgriculture() async {
    try {
      loading(true);
      var data = await ApiService().getAgriculture();
      // print("data is here " + data.toString());
      if (data != null) {
        agricultureList.clear();

        loading(false);
        data.forEach((v) {
          agricultureList.add(AgricultureData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getAgriculture Error');
    }
  }

  getGarbageManagement() async {
    try {
      loading(true);
      var data = await ApiService().getGarbageManagement();
      // print("data is here " + data.toString());
      if (data != null) {
        garbageManagementList.clear();

        loading(false);
        data.forEach((v) {
          garbageManagementList.add(GarbageManagementData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getGarbageManagement Error');
    }
  }

  getWater() async {
    try {
      loading(true);
      var data = await ApiService().getWater();
      // print("data is here " + data.toString());
      if (data != null) {
        waterList.clear();

        loading(false);
        data.forEach((v) {
          waterList.add(WaterData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getWater Error');
    }
  }

  getTourism() async {
    try {
      loading(true);
      var data = await ApiService().getTourism();
      // print("data is here " + data.toString());
      if (data != null) {
        waterList.clear();

        loading(false);
        data.forEach((v) {
          waterList.add(WaterData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getTourism Error');
    }
  }

  getFooterText() async {
    try {
      loading(true);
      var data = await ApiService().getFooterText();
      // print("data is here " + data.toString());
      if (data != null) {
        footerTextList.clear();

        loading(false);
        data.forEach((v) {
          footerTextList.add(FooterHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getReconciliations Error');
    }
  }

  getDocumentNotice() async {
    try {
      loading(true);
      var data = await ApiService().getDocumentNotice();
      // print("data is here " + data.toString());
      if (data != null) {
        documentNoticeList.clear();

        loading(false);
        data.forEach((v) {
          documentNoticeList.add(NoticeHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loading(false);
      log(e.toString(), name: 'getDocumentNotice Error');
    }
  }

  getServiceCategory() async {
    try {
      loadings.value = true;
      loadingServiceCategory.value = true;
      var data = await ApiService().getServiceCategory();

      if (data != null) {
        loadingServiceCategory.value = false;
        // await Future.delayed(const Duration(seconds: 2));
        loadings.value = false;
        serviceCategory.clear();
        data.forEach((v) {
          serviceCategory.add(ServiceCategoryHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      loadingServiceCategory.value = false;
      loadings.value = false;
      log(e.toString(), name: 'getServiceCategory error');
    } finally {
      loadings.value = false;
      loadingServiceCategory.value = false;
    }
  }

  getPublicService() async {
    try {
      loadings.value = true;
      var data = await ApiService().getPublicService();

      if (data != null) {
        await Future.delayed(const Duration(milliseconds: 500));
        loadings.value = false;
        publicService.clear();
        data.forEach((v) {
          publicService.add(PublicSericeHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getServiceCategory error');
    }
  }

  getOnlineService() async {
    try {
      loadings.value = true;
      var data = await ApiService().getOnlineService();
      if (data != null) {
        loadings.value = false;
        onlineService.clear();
        data.forEach((v) {
          onlineService.add(OnlineServicesData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'getServiceCategory error');
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

  fetchJobDescription() async {
    try {
      var data = await ApiService().getJobDescrpition();
      if (data != null) {
        jobDescriptionList.clear();
        data.forEach((v) {
          jobDescriptionList.add(JobDescriptionHeaderModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchJobDescription Error');
    }
  }

  fetchFiscalYear() async {
    try {
      loadingFiscalYear.value = true;
      var data = await ApiService().getFiscalYear();
      if (data != null) {
        loadingFiscalYear.value = false;
        fiscalYearList.clear();
        data.forEach((v) {
          fiscalYearList.add(FiscalYearHeadingModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchJobDescription Error');
    } finally {
      loadingFiscalYear.value = false;
    }
  }

  fetchLawType() async {
    try {
      var data = await ApiService().getLawType();
      if (data != null) {
        lawtypeList.clear();
        data.forEach((v) {
          lawtypeList.add(LawTypeHeading.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchJobDescription Error');
    }
  }

  fetchLawLevel() async {
    try {
      var data = await ApiService().getLawLevel();
      if (data != null) {
        lawlevelList.clear();
        data.forEach((v) {
          lawlevelList.add(LawTypeHeading.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchJobDescription Error');
    }
  }

  searchLaw() async {
    searchLoading.value = true;
    try {
      var data = await ApiService().searchLaw(searchtxt.text);
      searchLaws.refresh();
      log(searchtxt.text);

      if (data != null) {
        searchLoading.value = false;
        searchLaws.clear();

        searchtxt.clear();
        // update();

        data.forEach((v) {
          searchLaws.add(LawData.fromJson(v));
        });
      } else {
        // getSnackbar(message: 'No Law Found');
        // searchlaws.clear();
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'SeachLaw Error');
    }
  }

  fetchServiceGroup() async {
    searchLoading.value = true;
    try {
      var data = await ApiService().serviceGroup();
      // refresh();
      if (data != null) {
        serviceGroup.clear();
        data.forEach((v) {
          serviceGroup.add(ServiceGroupHeadingModel.fromJson(v));
        });
      } else {}
    } on Exception catch (e) {
      log(e.toString(), name: 'officetype Error');
    }
  }

  Future fetchElectedOffical() async {
    // searchLoading.value = true;
    try {
      electedLoading.value = true;
      var data = await ApiService().getElectedOfficials();
      if (data != null) {
        // await Future.delayed(const Duration(seconds: 2));
        electedLoading.value = false;
        electedOffical.clear();
        data.forEach((v) {
          electedOffical.add(ElectedOfficalsData.fromJson(v));
        });
        // await fetchNotice();
      } else {
        electedLoading.value = false;
      }
    } on Exception catch (e) {
      electedLoading.value = false;
      log(e.toString(), name: 'electedoffical Error');
    } finally {
      electedLoading.value = false;
    }
  }

  fetchTeams() async {
    try {
      var data = await ApiService().getteams();
      teamlist.clear();
      //  refresh();
      if (data != null) {
        data.forEach((v) {
          teamlist.add(TeamData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchTeams error');
    }
  }

  fetchOfficeContact() async {
    try {
      var data = await ApiService().getSuchanaAdhikari();
      informationOfficer.clear();
      // refresh();
      if (data != null) {
        data.forEach((v) {
          informationOfficer.add(SuchanaAdhikariData.fromJson(v));
          print("new info officer$informationOfficer");
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'fetchTeams error');
    }
  }
}
