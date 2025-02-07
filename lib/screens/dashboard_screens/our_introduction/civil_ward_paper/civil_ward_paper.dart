// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gandakimun/constants.dart';
// import 'package:gandakimun/controllers/appcontroller.dart';
// import 'package:gandakimun/controllers/introductioncontroller.dart';
// import 'package:gandakimun/screens/dashboard_screens/our_introduction/civil_ward_paper/filter_service_group.dart';
// import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
// import 'package:gandakimun/widget/appbar.dart';
// import 'package:gandakimun/widget/custom_tile.dart';
// import 'package:gandakimun/widget/heading.dart';
// import 'package:gandakimun/widget/shimmer.dart';
//
// class CivilWardPapersPage extends StatelessWidget {
//   CivilWardPapersPage({Key? key}) : super(key: key);
//
//   final controller = Get.put(AppController());
//   final ourInformationController = Get.put(OurInformationController());
//   final introController = Get.put(IntroductionController());
//
//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     // var list = ourInformationController.civilWardPaperList;
//
//     introController.fetchOfficeType();
//
//     return Scaffold(
//         backgroundColor: AppColor.backgroundClr,
//         appBar: buildAppbar(
//           controller.isNepali.value ? 'नागरिक वडापत्र' : 'Civil Ward Paper',
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               buildHeading(
//                 controller.isNepali.value
//                     ? 'नागरिक वडापत्र'
//                     : 'Civil Ward Paper',
//               ),
//               const SizedBox(height: 10),
//
//               Obx(
//                 () => introController.loadingOfficeType.isTrue
//                     ? Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: ListView.builder(
//                           itemCount: 8,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return const Skelton(
//                                 height: 50, width: double.infinity);
//                           },
//                         ),
//                       )
//                     : ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: introController.officeType.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           var data = introController.officeType[index];
//                           return CustomTile(
//                             ontap: () {
//                               Get.to(FilterServiceGroupFromCivil(officeTypeHeadingModel: data,));
//                             },
//                             title: controller.isNepali.value
//                                 ? data.title!.np.toString()
//                                 : data.title!.en.toString(),
//                           );
//                         }),
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class OrganizationStructureButton extends StatelessWidget {
//   final AppController controller;
//   final String npText;
//   final String enText;
//   final Function() onPressed;
//   const OrganizationStructureButton({
//     Key? key,
//     required this.controller,
//     required this.npText,
//     required this.enText,
//     required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           minimumSize: const Size(350, 50),
//           maximumSize: const Size(400, 50),
//         ),
//         onPressed: onPressed,
//         child: Text(controller.isNepali.value ? npText : enText),
//       ),
//     );
//   }
// }
