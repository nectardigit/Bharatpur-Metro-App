import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/controllers/staff_login_controller.dart';
import 'package:gandakimun/model/document_notice.dart';
import 'package:gandakimun/screens/dashboard_screens/download_page/forms_of_application.dart';
import 'package:gandakimun/screens/dashboard_screens/important_links_page/important_links.dart';
import 'package:gandakimun/screens/dashboard_screens/judicial_committee_page/judicial_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/notice_and_information.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/examination_application_page.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/house_map_permit_page.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/online_application_registration_page.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/online_list_registration_page.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/online_recommendation_page.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/online_service.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/other_revenue_page.dart';
import 'package:gandakimun/screens/dashboard_screens/online_services/property_tax_payment_page.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/our_introduction_page.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/public_service_page.dart';
import 'package:gandakimun/screens/dashboard_screens/urgent_contact_no_page/essential_contacts.dart';
import 'package:gandakimun/screens/home/cao_spokeperson.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/screens/home/notice_details.dart';
import 'package:gandakimun/screens/home/staff_dashboard.dart';
import 'package:gandakimun/screens/notification/general_notifications_screen.dart';
import 'package:gandakimun/screens/notification/notification_screen.dart';
import 'package:gandakimun/screens/other/dashboard_inside_page.dart';
import 'package:gandakimun/screens/other/register_complaint_problem.dart';
import 'package:gandakimun/screens/staff_screens/profile/profile_screen.dart';
import 'package:gandakimun/utils/svg_helper.dart';
import 'package:gandakimun/widget/box_shadow.dart';
import 'package:gandakimun/widget/dashboard_card.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/information_officer.dart';
import 'package:gandakimun/widget/office_contact_info.dart';
import 'package:gandakimun/widget/officials.dart';
import 'package:gandakimun/widget/other_informations.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/teams.dart';
import '../../widget/drawer.dart';
import '../../widget/search.dart';
import '../login/login_view.dart';
import '../scroll_controller.dart';
import '../share.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(AppController());

  final homecon = Get.put(HomeController());
  final mainHomeController = Get.put(HomePageController());

  final staffcon = Get.put(StaffController());

  final hrmcon = Get.put(HrmController());
  final ourInformationController = Get.put(OurInformationController());

  ScrollController _scrollController = new ScrollController();
  ScrollController scrollController = new ScrollController();

  // final ourInformationController = Get.put(AppController());
  @override
  void initState() {
    controller.getFooterText();
    getData();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScrollPosition = _scrollController.position.pixels;
        if (maxScrollExtent > currentScrollPosition) {
          _scrollController.animateTo(currentScrollPosition + 50,
              duration: const Duration(milliseconds: 10), curve: Curves.linear);
        } else {
          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 10), curve: Curves.linear);
        }
      }
    });

    super.initState();
  }

  List<NoticeHeadingModel> datas = [];

  @override
  void dispose() {
    super.dispose();
    Get.delete<AppController>();
    Get.delete<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController scrollControllerNew =
        Get.put(BottomNavigationController());

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        scrollControllerNew.hide();
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        scrollControllerNew.show();
      }
    });

    Size size = MediaQuery.of(context).size;

    datas = controller.noticeList;

    var textListNepali = datas.map((e) => e.title!.np.toString()).toList();

    int selectedIndex = 0;

    var dataObjects = [];

    // for (var data in datas) {
    //   dataObjects.add(DataNoticeModel(
    //       title: data!.title!.en.toString(), id: data.id.toString()));
    // }

    // print(homecon.token);
    final List<String> title = [
      "Our Introduction",
      "Notice and Information",
      "Online Services",
      "Download",
      "Judicial Committee",
      "Services Category",
      "Important links",
      "Urgent Contact No.",
      "Grievance Management",
    ];
    final List<String> nptitle = [
      "हाम्रो परिचय",
      "सुचना तथा जानकारी",
      "अनलाइन सेवाहरु",
      "डाउनलोड",
      "न्ययिक समिति",
      "सेवा वर्गहरु",
      "महत्वपूर्ण लिङ्कहरु",
      "अत्यावस्यक सम्पर्क नं.",
      "गुनासो व्यवस्थापन",
    ];
    final List<String> img = [
      AppIcons.home,
      AppIcons.news,
      AppIcons.onlineLinks,
      AppIcons.canteen,
      AppIcons.law,
      AppIcons.people,
      AppIcons.importantLinks,
      AppIcons.contact,
      AppIcons.suggestion,
    ];

    return GetBuilder<HomePageController>(builder: (mainController) {
      List<TeamData> isCao =
          controller.teamlist.where((e) => e.isCao == 1).toList();
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppColor.backgroundClr,
            drawer: const DrawerWidget(),
            body: controller.loadingDashboard == true
                ? const LinearProgressIndicator()
                : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 2));
                      controller.initializer();
                      mainHomeController.initializers();
                    },
                    child: DefaultTabController(
                      length: 2,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30),
                            buildAppbar(context, size),
                            // buildsizedbox(),
                            const SizedBox(height: 10),

                            buildSlider(context),

                            buildsizedbox(),

                            StaffDashboard(),

                            Container(
                              height: 50,
                              color: Colors.white,
                              child: controller.loadingNotice.value == true
                                  ? LinearProgressIndicator(
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.6),
                                      color: Colors.white,
                                    )
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: 80.0,
                                          height: 100.0,
                                          child: Stack(
                                            children: [
                                              SvgWidget(painters: [
                                                SvgPathPainter.fill()
                                                  ..addPath(
                                                      'M0 0L70 0L70 16.1585L80 25.3049L70 36.2805L70 50L0 50L0 0Z')
                                                  ..color = AppColor.primaryClr,
                                              ]),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    controller.isNepali.value
                                                        ? 'सूचना'
                                                        : 'Notice',
                                                    style: titleStyle.copyWith(
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              controller: _scrollController,
                                              itemCount: textListNepali.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedIndex = index;
                                                    });
                                                    final selectedData =
                                                        datas[selectedIndex];
                                                    Get.to(NoticeDetailScreen(
                                                        noticeHeadingModel:
                                                            selectedData));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 2.0),
                                                    child: Text(
                                                      textListNepali[index],
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 250,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: title.length,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      transform: Matrix4.identity()
                                        ..scale(controller.isNepali.value
                                            ? 1.0
                                            : 0.9),
                                      child: DashboardCard(
                                        img: img[index],
                                        title: controller.isNepali.value
                                            ? nptitle[index]
                                            : title[index],
                                        ontap: () {
                                          switch (index) {
                                            case 0:
                                              {
                                                Get.to(() =>
                                                    OurIntroductionPage());
                                              }
                                              break;
                                            case 1:
                                              getToNoticeAndInformationPage();
                                              break;
                                            case 2:
                                              {
                                                Get.to(() =>
                                                    OnlineServiceScreen());
                                              }
                                              break;
                                            case 3:
                                              {
                                                Get.to(() =>
                                                    FormsOfApplicationPage());
                                              }
                                              break;
                                            case 4:
                                              {
                                                Get.to(() => JudicialPage());
                                              }
                                              break;
                                            case 5:
                                              getToPublicServicesPage();
                                              break;
                                            case 6:
                                              {
                                                Get.to(() =>
                                                    ImportantLinkScreen());
                                              }
                                              break;
                                            case 7:
                                              {
                                                Get.to(
                                                    () => EssentialContacts());
                                              }
                                              break;
                                            case 8:
                                              {
                                                Get.to(
                                                    () => const SamasyaDarta());
                                              }
                                              break;
                                            default:
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            buildsizedbox(),
                            Officials(),
                            buildsizedbox(),
                            const Divider(),
                            isCao.isNotEmpty
                                ? const CaoAndSpokePersonScreen()
                                : const SizedBox(),
                            Obx(
                              () => buildHeading(controller.isNepali.isTrue
                                  ? 'अन्य जानकारी'
                                  : 'Other Informations'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            OtherInformations(),
                            buildsizedbox(),
                            Obx(
                              () => buildHeading(controller.isNepali.isTrue
                                  ? 'सूचना अधिकारी'
                                  : 'Information Officer'),
                            ),
                            InformationOfficerScreen(),
                            buildsizedbox(),
                            Obx(
                              () => buildHeading(controller.isNepali.isTrue
                                  ? 'कार्यालय सम्पर्क'
                                  : 'Office Contact'),
                            ),
                            const OfficeContactInfoScreen(),
                            buildsizedbox(),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.footerTextList.length,
                                padding: const EdgeInsets.only(bottom: 0),
                                itemBuilder: (context, index) {
                                  var data = controller.footerTextList[index];
                                  return Container(
                                    alignment: Alignment.center,
                                    color: AppColor.primaryClr,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      controller.isNepali.value
                                          ? data.title!.np.toString()
                                          : data.title!.en.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    });
  }

  GetBuilder<AppController> buildSlider(BuildContext context) {
    return GetBuilder<AppController>(
        builder: (appController) => appController.loadingCarousel.value == false
            ? CarouselSlider(
                options: CarouselOptions(
                  height: 160.0,
                  autoPlay: true,
                  reverse: false,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                ),
                items: <Widget>[
                  for (var i = 0; i < appController.bannerList.length; i++)
                    Stack(
                      children: [
                        SizedBox(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl:
                                appController.bannerList[i].image.toString(),
                            placeholder: (context, url) => const SizedBox(
                                height: 50,
                                width: 50,
                                child: Center(
                                    child: CupertinoActivityIndicator())),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 130),
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                                child: Text(
                              appController.isNepali.value
                                  ? appController.bannerList[i].bannerTitle!.np
                                      .toString()
                                  : appController.bannerList[i].bannerTitle!.en
                                      .toString(),
                              style:
                                  subtitleStyle.copyWith(color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                ],
              )
            : const Padding(
                padding: EdgeInsets.all(8.0),
                child: Skelton(
                  height: 150,
                  width: double.infinity,
                ),
              ));
  }

  buildsearch(context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: MySearchDelegate());
      },
      child: Container(
        height: 40,
        width: Device.orientation == Orientation.portrait ? 45.5.w : 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.4,
              color: Colors.black54,
            )),
        child: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Center(
                child: Text(
              'Search',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            )),
          ],
        ),
      ),
    );
  }

  getToNoticeAndInformationPage() {
    final List<String> title = [
      "Notice",
      "Plans",
      "Budget and Programmes",
      "Laws",
      "Gazette",
      "Reports",
      "Self Publication"
    ];
    final List<String> nptitle = [
      "सुचना",
      "योजनाहरु",
      "बजेट तथा कार्यक्रमहरु",
      "कानुन",
      "राजपत्र",
      "प्रतिबेदनहरु",
      "स्वत:प्रकाशन"
    ];
    final List<String> img = [
      AppIcons.news,
      AppIcons.home,
      AppIcons.canteen,
      AppIcons.onlineLinks,
      AppIcons.law,
      AppIcons.people,
      AppIcons.certificate,
      AppIcons.contact,
      AppIcons.importantLinks,
    ];
    {
      Get.to(() => Obx(
            () => DashBoardInsidePage(
                widget: NoticeDashboardWidget(
                    title: title,
                    img: img,
                    controller: controller,
                    nptitle: nptitle),
                appBarTitle: controller.isNepali.value
                    ? 'सुचना तथा जानकारी'
                    : 'Notice and Information'),
          ));
    }
  }

  getToOnlineServices() {
    final List<String> title = [
      'Online Application Registration',
      'Online Recommendation',
      'Online List Registration',
      'Property Tax Payment',
      'Other revenue',
      'House Map Permit',
      'Examination Application',
    ];
    final List<String> nptitle = [
      'अनलाइन निवेदन दर्ता',
      'अनलाइन सिफारिस',
      'अनलाइन सुची दर्ता',
      'सम्पत्ति कर भुक्तानी',
      'अन्य राजस्व',
      'घर नक्सा इजाजत',
      'परिक्षा आवेदन',
    ];
    final List<String> img = [
      AppIcons.home,
      AppIcons.news,
      AppIcons.onlineLinks,
      AppIcons.canteen,
      AppIcons.law,
      AppIcons.people,
      AppIcons.importantLinks,
    ];
    {
      Get.to(
        () => Obx(() => DashBoardInsidePage(
            widget: GridView.builder(
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: title.length,
              itemBuilder: (context, indexx) {
                return DashboardCard(
                    img: img[indexx],
                    title: controller.isNepali.value
                        ? nptitle[indexx]
                        : title[indexx],
                    ontap: () {
                      switch (indexx) {
                        case 0:
                          {
                            Get.to(() => OnlineApplicationRegistrationPage());
                          }
                          break;
                        case 1:
                          {
                            Get.to(() => OnlineRecommendationPage());
                          }
                          break;
                        case 2:
                          {
                            Get.to(() => OnlineListRegistrationPage());
                          }
                          break;
                        case 3:
                          {
                            Get.to(() => PropertyTaxPaymentPage());
                          }
                          break;
                        case 4:
                          {
                            Get.to(() => OtherRevenuePage());
                          }
                          break;
                        case 5:
                          {
                            Get.to(() => HouseMapPermitPage());
                          }
                          break;
                        case 6:
                          {
                            Get.to(() => ExaminationApplicationPage());
                          }
                          break;
                        default:
                      }
                    });
              },
            ),
            appBarTitle: controller.isNepali.value
                ? 'अनलाइन सेवाहरु'
                : 'Online Services')),
      );
    }
  }

  getToDownloadPage() {
    final List<String> title = ["Important Form"];
    final List<String> nptitle = ["महत्त्वपूर्ण फारम"];
    final List<String> img = [
      AppIcons.checklist,
    ];
    {
      Get.to(() => Obx(
            () => DashBoardInsidePage(
                widget: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: title.length,
                  itemBuilder: (context, indexx) {
                    return DashboardCard(
                        img: img[indexx],
                        title: controller.isNepali.value
                            ? nptitle[indexx]
                            : title[indexx],
                        ontap: () {
                          Get.to(() => FormsOfApplicationPage());
                        });
                  },
                ),
                appBarTitle:
                    controller.isNepali.value ? 'डाउनलोड' : 'Download'),
          ));
    }
  }

  getToPublicServicesPage() {
    {
      Get.to(() => Obx(
            () => DashBoardInsidePage(
              widget: const PublicServicePage(),
              appBarTitle: controller.isNepali.value
                  ? "सेवा वर्गहरू"
                  : "Services Category",
            ),
          ));
    }
  }

  getToGrievanceManagementPage() {
    {
      Get.to(() => Obx(
            () => DashBoardInsidePage(
              widget: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [buildBoxShadow()],
                    ),
                    child: const Text('Grievance Management'),
                  )
                ],
              ),
              appBarTitle: controller.isNepali.value
                  ? "गुनासो व्यवस्थापन"
                  : "Grievance Management",
            ),
          ));
    }
  }

  buildAppbar(context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 22.sp,
                      color: AppColor.primaryClr,
                    )),
              ),
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  AppIcons.nationallogo,
                  height: 25.sp,
                  // color: AppColor.primaryClr,
                ),
              ),
            ],
          ),
        ),
        Text(
          controller.isNepali.value
              ? "गण्डकी गाउँपालिका"
              : "Gandaki Rural Municipality",
          style: const TextStyle(
              fontWeight: FontWeight.w700, color: Colors.black54, fontSize: 18),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationView(
                      index: 0,
                    ),
                  ),
                );
              },
              icon: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.notifications_none),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: Obx(() => Text(
                                "${homecon?.pushNotificationCount ?? 0}",
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'share',
                  child: GestureDetector(
                    onTap: () async {
                      controller.initializer();
                      mainHomeController.initializers();
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.refresh,
                        color: AppColor.primaryClr,
                      ),
                      title: Text('Refresh'),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'share',
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const QrCode());
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.share,
                        color: AppColor.primaryClr,
                      ),
                      title: Text('Share app'),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'exit',
                  child: GestureDetector(
                    onTap: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: AppColor.primaryClr,
                      ),
                      title: Text('Exit'),
                    ),
                  ),
                ),
              ],
              child: Icon(
                Icons.more_vert,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ],
    );
  }

  buildNewsList(leading, title, subtitle) {
    return ListTile(
      leading: Image.asset(leading),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Future<DoucmentNoticeModel> getData() async {
    final response = await http.get(Uri.parse(
        'https://gandakimun.amritsparsha.com/api/documenttag-notice'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return DoucmentNoticeModel.fromJson(data);
    }
    throw Exception('Fetch Issue');
  }
}

class DataNoticeModel {
  String? id;
  String? title;

  DataNoticeModel({this.id, this.title});
}
