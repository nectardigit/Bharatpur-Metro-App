import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/laws_notice_page.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/animal_service_screen.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/education_screen.dart';

import 'package:gandakimun/screens/quick_link_screens/elected_officials_screen.dart';
import 'package:gandakimun/screens/quick_link_screens/health_screen.dart';
import 'package:gandakimun/screens/quick_link_screens/sport_screen.dart';
import 'package:gandakimun/widget/box_shadow.dart';

import 'heading.dart';

class QuickLinks extends StatelessWidget {
  QuickLinks({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => buildHeading(
              controller.isNepali.isTrue ? 'कुइक्क लिन्क्स ' : 'Quick Links'),
        ),
        const SizedBox(
          height: 10,
        ),
        buildQuickLinkTile(),
      ],
    );
  }

  buildQuickLinkTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Obx(
          () => Wrap(
            runSpacing: 20,
            spacing: 20,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              buildQuickCard(AppIcons.shikshya,
                  controller.isNepali.value ? 'शिक्षा' : 'Education', () {
                Get.to(() => EducationScreen());
              }),
              buildQuickCard(AppIcons.pasusewa,
                  controller.isNepali.value ? 'पशुसेवा' : 'Animal service', () {
                Get.to(() => AnimalServiceScreen());
              }),
              buildQuickCard(AppIcons.khelkud,
                  controller.isNepali.value ? 'खेलकुद' : 'Sports', () {
                Get.to(() => SportScreen());
              }),
              buildQuickCard(
                  AppIcons.kanun, controller.isNepali.value ? 'कानून' : 'Law',
                  () {
                Get.to(() => Laws());
              }),
              // buildQuickCard(AppIcons.karmachari,
              //     controller.isNepali.value ? 'कर्मचारी' : 'Staff', () {}),
              buildQuickCard(AppIcons.swasthya,
                  controller.isNepali.value ? 'स्वास्थ्य' : 'Health', () {
                Get.to(() => HealthScreen());
              }),
              // buildQuickCard(AppIcons.sahakari, 'सहकारी', () {}),
              buildQuickCard(AppIcons.padhakari,
                  controller.isNepali.value ? 'पदाधिकारी' : "Elected Officials",
                  () {
                Get.to(ElectedOfficialsScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }

  buildQuickCard(img, text, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 100,
        // height: 110,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [buildBoxShadow()],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            SvgPicture.asset(
              img,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: subtitleStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
