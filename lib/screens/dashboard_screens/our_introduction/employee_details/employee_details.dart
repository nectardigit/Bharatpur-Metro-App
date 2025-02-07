// import 'package:flutter/material.dart';
// import 'package:gandakimun/constants.dart';
// import 'package:gandakimun/controllers/appcontroller.dart';
// import 'package:gandakimun/controllers/introductioncontroller.dart';
// import 'package:gandakimun/widget/appbar.dart';
// import 'package:gandakimun/widget/box_shadow.dart';
// import 'package:gandakimun/widget/heading.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import 'office_name_filter.dart';
//
// class EmployeeDetails extends StatefulWidget {
//   const EmployeeDetails({Key? key}) : super(key: key);
//
//   @override
//   State<EmployeeDetails> createState() => _EmployeeDetailsState();
// }
//
// class _EmployeeDetailsState extends State<EmployeeDetails> {
//   var controller = Get.put(AppController());
//   final introductionController = Get.put(IntroductionController());
//
//   @override
//   Widget build(BuildContext context) {
//     introductionController.fetchOfficeType();
//
//     return Scaffold(
//         backgroundColor: AppColor.backgroundClr,
//         appBar: buildAppbar(
//             controller.isNepali.value ? 'कर्मचारी विवरण' : 'Employee Details'),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               buildHeading(controller.isNepali.value
//                   ? "कर्मचारी विवरण"
//                   : 'Employee Details'),
//               const SizedBox(height: 10),
//               Obx(
//                 () => introductionController.loadingOfficeType.value == true
//                     ? LinearProgressIndicator()
//                     : ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: introductionController.officeType.length,
//                         physics: const BouncingScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           var data = introductionController.officeType[index];
//                           return GestureDetector(
//                             onTap: () {
//                               Get.to(OfficeNameFilterScreen(
//                                 officeTypeHeadingModel: data,
//                                 // text: 'Tax Payer Service Center',
//                               ));
//                             },
//                             child: ListTile(
//                               title: Card(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(25.0),
//                                   child: Text(controller.isNepali.value
//                                       ? data.title!.np.toString()
//                                       : data.title!.en.toString()),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//               ),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(ExecutiveScreen());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? 'नगर कार्यपालिकाको कार्यालय'
//               //         : 'Office of Municipal Executive'),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(WardOfficeScreen());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? 'वडा कार्यालय'
//               //         : 'Ward Office'),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(HealthSectionOfficer());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? 'स्वास्थ्य शाखा'
//               //         : 'Health Section'),
//             ],
//           ),
//         ));
//   }
//
//   Widget buildCard(
//       String subtitle, String title, String link, ontap, Size size) {
//     return InkWell(
//       onTap: ontap,
//       child: Container(
//         height: 35.w,
//         width: 45.w,
//         decoration:
//             BoxDecoration(color: Colors.white, boxShadow: [buildBoxShadow()]),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: size.height * .15,
//                 width: size.width * .4,
//                 foregroundDecoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: NetworkImage(link), fit: BoxFit.contain),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 title,
//                 style: subtitleStyle,
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 child: Text(
//                   subtitle,
//                   style: titleStyle.copyWith(
//                       fontSize: 17.sp, fontWeight: FontWeight.w500),
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
