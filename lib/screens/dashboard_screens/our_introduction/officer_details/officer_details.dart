// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/officer_details/city_council.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/officer_details/executive_commtie.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/officer_details/judicial_committe.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/officer_details/ward_committe.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/box_shadow.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';

import '../controller/our_information.dart';

class OfficeDetails extends StatelessWidget {
  OfficeDetails({Key? key}) : super(key: key);

  final controller = Get.put(AppController());
  final officerDetail = Get.put(HomePageController());
  final ourInformationController = Get.put(OurInformationController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ourInformationController.fetchWards();
    });
    // Size size = MediaQuery.of(context).size;
    // var set = <String>{};
    // List<ElectedOfficialsData> duplicateName = officerDetail
    //     .electedOfficialsModel.data!
    //     .where((e) => set.add(e.councildDesignation!.np.toString()))
    //     .toList();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
            controller.isNepali.value ? 'जनप्रतिनिधि विवरण' : 'Officer Details'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(controller.isNepali.value
                  ? "जनप्रतिनिधि विवरण"
                  : 'Officer Details'),
              const SizedBox(height: 10),
              CustomTile(
                ontap: () {
                  Get.to(CityCouncilMember());
                },
                title: controller.isNepali.value ? 'गाउँपालिका सभा' : 'City Council',
              ),
              CustomTile(
                ontap: () {
                  Get.to(ExecutiveCommitteMember());
                },
                title: controller.isNepali.value
                    ? 'गाउँपालिका कार्यपालिका'
                    : 'Executive Committee',
              ),
              CustomTile(
                ontap: () {
                  Get.to(JudicialCommitteMember());
                },
                title: controller.isNepali.value
                    ? 'न्यायिक समिति'
                    : 'Judicial Committee',
              ),
              CustomTile(
                ontap: () {
                  Get.to(WardCommitte());
                },
                title:
                    controller.isNepali.value ? 'वडा समिति' : 'Ward Committee',
              ),
              // Column(
              //   children: duplicateName
              //       .map((e) => Padding(
              //             padding: const EdgeInsets.symmetric(
              //                 horizontal: 10.0, vertical: 10),
              //             child: Card(
              //               color: Colors.red,
              //               child: Center(
              //                 child: SizedBox(
              //                   height: 50,
              //                   width: double.infinity,
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 10.0, left: 10),
              //                     child: Text(
              //                         '${controller.isNepali.value ? e.councildDesignation!.np : e.councildDesignation!.en}'),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ))
              //       .toList(),
              // SizedBox(
              //   height: size.height * .8,
              //   width: size.width * .98,
              //   child: GridView.builder(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     gridDelegate:
              //         const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 5.0,
              //       mainAxisSpacing: 5.0,
              //     ),
              //     itemCount:
              //         ourInformationController.officerDetailsList.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       var data =
              //           ourInformationController.officerDetailsList[index];
              //       return buildCard(
              //           controller.isNepali.value
              //               ? parse(data.designation!.np.toString())
              //                   .body!
              //                   .text
              //               : parse(data.designation!.en.toString())
              //                   .body!
              //                   .text,
              //           controller.isNepali.value
              //               ? parse(data.details!.np.toString()).body!.text
              //               : parse(data.details!.en.toString()).body!.text,

              //           // data.profile.toString(),
              //           () {},
              //           size);
              //     },
              //   ),
              // ),
              // ),
            ],
          ),
        ));
  }

  Widget buildCard(
      String title, String subtitle, /*String link,*/ ontap, Size size) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 35.w,
        width: 45.w,
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: [buildBoxShadow()]),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Container(
                height: size.height * .15,
                width: size.width * .4,
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(link), fit: BoxFit.contain),
                ),
              ),
              const SizedBox(
                height: 10,
              ),*/

              Text(
                title,
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                child: Text(
                  subtitle,
                  style: titleStyle.copyWith(
                      fontSize: 17.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
