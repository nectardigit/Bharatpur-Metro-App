import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/database/app_storage.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/bida_kaj_chetra_list.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/chetra_vhraman_screen.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/bida_aavedan_screen.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/kaj_aavedan.dart';
import 'package:gandakimun/screens/staff_screens/ims/item_request_screen.dart';
import 'package:gandakimun/screens/staff_screens/ims/item_requested_list.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/nodata.dart';

import '../../constants.dart';
import '../../controllers/appcontroller.dart';
import '../login/login_view.dart';

class StaffDashboard extends StatelessWidget {
  StaffDashboard({Key? key}) : super(key: key);
  final controller = Get.put(HrmController());
  final appcontroller = Get.put(AppController());

  final List<String> title = ["HRM System", "IMS", "Fuel Request", "Canteen"];
  final List<String> nptitle = [
    "एच. आर. एम",
    "आई. एम. एस",
    "इन्धन अनुरोध",
    "चमेना गृह"
  ];
  final List<String> img = [
    AppIcons.hakiri,
    AppIcons.inventory,
    AppIcons.gas,
    AppIcons.canteen
  ];

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //     () => AppStorage.readIsLoggedIn == true || controller.isLoggedin.isTrue
        //         ?
        (AppStorage.readIsLoggedIn == true ||
                controller.isLoggedin.value == true)
            ? Container(
                // height: 210,
                margin: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.grey.shade400,
                        offset: const Offset(0, -2),
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2,
                  children: [
                    ...List.generate(
                        4,
                        (index) => GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: const Offset(0, -2),
                                          color: Colors.grey.shade400)
                                    ],
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                    child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      img[index],
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Flexible(
                                      child: Obx(
                                        () => Text(
                                          appcontroller.isNepali.value
                                              ? nptitle[index]
                                              : title[index],
                                          style: subtitleStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                              onTap: () {
                                print('object');
                                if (AppStorage.readIsLoggedIn != true) {
                                  _buildDialog(context, widgets: [
                                    Obx(
                                      () => buildNologin(
                                          txt: appcontroller.isNepali.value
                                              ? "लगइन भएको  छैन "
                                              : 'Not Logged in'),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Obx(() => customButton(
                                            appcontroller.isNepali.value
                                                ? "लगइन"
                                                : 'Login', () {
                                          Get.back();
                                          Get.to(() => LoginView());
                                        })),
                                  ]);
                                  // getSnackbar(
                                  //     message: 'Staff Login required',
                                  //     bgColor: Colors.red);
                                } else {
                                  switch (index) {
                                    case 0:
                                      _buildDialog(
                                        context,
                                        widgets: [
                                          customButton(
                                              appcontroller.isNepali.value
                                                  ? 'बिदा आवेदन'
                                                  : "Leave Request", () {
                                            Get.back();

                                            Get.to(
                                              () => BidaAavedanScreen(
                                                title:
                                                    appcontroller.isNepali.value
                                                        ? 'बिदा आवेदन'
                                                        : "Leave application",
                                              ),
                                            );
                                          }),
                                          customButton(
                                              appcontroller.isNepali.value
                                                  ? 'काज आवेदन'
                                                  : 'Visit application', () {
                                            Get.back();

                                            Get.to(
                                              () => KajAavedanScreen(
                                                title:
                                                    appcontroller.isNepali.value
                                                        ? 'काज आवेदन'
                                                        : 'Visit application',
                                              ),
                                            );
                                          }),
                                          customButton(
                                              appcontroller.isNepali.value
                                                  ? 'क्षेत्र भ्रमण आवेदन'
                                                  : 'Field visit application',
                                              () {
                                            Get.back();

                                            Get.to(() => ChetraVhramanScreen(
                                                title: appcontroller
                                                        .isNepali.value
                                                    ? 'क्षेत्र भ्रमण आवेदन'
                                                    : 'Field visit application'));
                                          }),
                                          customButton(
                                              appcontroller.isNepali.value
                                                  ? 'बिदा काज र क्षेत्र भम्रण सूची'
                                                  : 'Leave, visit & fieldvisit list',
                                              () {
                                            Get.back();

                                            Get.to(() => BidaKajChetraScreen(
                                                title: appcontroller
                                                        .isNepali.value
                                                    ? 'बिदा काज र क्षेत्र भम्रण सूची'
                                                    : 'Leave, visit & fieldvisit list'));
                                          })
                                        ],
                                      );
                                      break;
                                    case 1:
                                      _buildDialog(
                                        context,
                                        widgets: [
                                          customButton('Item Request Form', () {
                                            Get.to(() => ItemRequestScreen());
                                          }),
                                          customButton('Item Requested List',
                                              () {
                                            Get.to(() =>
                                                const ItemRequestedListScreen());
                                          }),
                                        ],
                                      );
                                      break;
                                    default:
                                  }
                                }
                              },
                            ))
                  ],
                ),
              )
            : Container();
    // : Container());
  }

  void _buildDialog(context, {required List<Widget> widgets}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            // height: 200,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
          ),
        );
      },
    );
  }
}
