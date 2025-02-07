import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/database/app_storage.dart';
import 'package:gandakimun/screens/about_screen.dart';
import 'package:gandakimun/screens/dashboard_screens/urgent_contact_no_page/essential_contacts.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppController controller = Get.put(AppController());

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final hrmcon = Get.put(HrmController());

  @override
  Widget build(BuildContext context) {
    return customdrawer();
  }

  customdrawer() {
    return Obx(
          () => Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 220,
              child: DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                          1,
                          (index) => Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .aboutlist[index].companyLogo
                                            .toString(),
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(controller.isNepali.value
                                        ? controller
                                            .aboutlist[index].companyName!.np
                                            .toString()
                                        : controller
                                            .aboutlist[index].companyName!.en
                                            .toString()),
                                  ],
                                ),
                              ))
                    ],
                  )),
            ),
            // Obx(
            //   () => SwitchListTile(

            //       title: Text(
            //         'English/नेपाली',
            //         style: subtitleStyle,
            //       ),
            //       activeColor: AppColor.primaryClr,
            //       inactiveThumbColor: AppColor.primaryClr,
            //       value: controller.isNepali.value,
            //       onChanged: (value) {
            //         if (controller.isNepali.value == false) {
            //           controller.isNepali.value = true;
            //           setState(() {});
            //         } else if (controller.isNepali.value == true) {
            //           controller.isNepali.value = false;
            //           setState(() {});
            //         }
            //       }),
            // ),
            buildDrawerTile(
              Icon(
                Icons.translate,
                size: 20.sp,
                color: Colors.blue,
              ),
              'English/Nepali',
              () {
                Get.back();
              },
              trailing: Switch(
                value: controller.isNepali.value,
                onChanged: (bool value) {
                  if (controller.isNepali.value == false) {
                    controller.isNepali.value = true;
                    Get.find<HomePageController>().fetchRefresh();
                  } else if (controller.isNepali.value == true) {
                    controller.isNepali.value = false;
                    Get.find<HomePageController>().fetchRefresh();
                  }
                },
              ),
            ),

            // buildDrawerTile(
            //     Icon(
            //       Icons.person,
            //       size: 20.sp,
            //       color: AppColor.primaryClr,
            //     ),
            //     controller.isNepali.value ? 'प्रोफाइल' : 'Profile', () {
            //   Get.to(() => ProfileScreen());
            // }),
            // const Divider(
            //   thickness: 2,
            // ),
            buildDrawerTile(
                SvgPicture.asset(
                  AppIcons.contact,
                  // color: Colors.grey,
                  height: 20,
                ),
                controller.isNepali.value
                    ? 'जरुरी नम्बरहरु'
                    : "Essential numbers", () {
              Get.to(() => EssentialContacts());
            }),
            const Divider(
              thickness: 2,
            ),
            buildDrawerTile(
                Icon(
                  Icons.mail,
                  size: 20.sp,
                ),
                controller.isNepali.value
                    ? 'एप्प्स डिभेलपर सँग सम्पर्क'
                    : "Contact the app developer",
                () {}),
            // buildDrawerTile(
            //     Icon(
            //       Icons.person,
            //       size: 20.sp,
            //     ),
            //     controller.isNepali.isTrue
            //         ? 'सूचना अधिकारी'
            //         : 'Information Officer', () {
            //   Get.to(InformationOfficerScreen());
            // }),
            // buildDrawerTile(
            //     Icon(
            //       Icons.contact_emergency,
            //       size: 20.sp,
            //     ),
            //     controller.isNepali.isTrue
            //         ? 'कार्यालय सम्पर्क'
            //         : 'Office Contact', () {
            //   Get.to(const OfficeContactInfoScreen());
            // }),
            buildDrawerTile(
                Icon(
                  Icons.info,
                  size: 20.sp,
                ),
                controller.isNepali.value
                    ? 'एप्प्सको बारेमा'
                    : "About application", () {
              Get.to(() => AboutScreen());
            }),
            const Divider(
              thickness: 2,
            ),
            Obx(
              () => hrmcon.isLoggedin.value == true
                  ? buildDrawerTile(
                      Icon(
                        Icons.logout,
                        size: 20.sp,
                      ),
                      'Logout',
                      () {
                        showDialog<Widget>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Logout',
                                  style: titleStyle,
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                        'Are you sure you want to Logout?',
                                        style: subtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Obx(
                                    () => TextButton(
                                      child: const Text('Logout'),
                                      onPressed: () {
                                        AppStorage.removeStorage();
                                        hrmcon.setloginValuefalse();
                                        setState(() {});
                                        Get.to(() => const HomeScreen());
                                      },
                                    ),
                                  ),
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerTile(Widget icon, title, ontap, {Widget? trailing}) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: subtitleStyle,
      ),
      onTap: ontap,
      trailing: trailing ?? const SizedBox(),
    );
  }
}
