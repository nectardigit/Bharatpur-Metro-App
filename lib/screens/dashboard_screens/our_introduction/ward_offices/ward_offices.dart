// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gandakimun/constants.dart';
// import 'package:gandakimun/controllers/appcontroller.dart';
// import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
// import 'package:gandakimun/widget/appbar.dart';
// import 'package:gandakimun/widget/custom_tile.dart';
// import 'package:gandakimun/widget/heading.dart';
// import 'package:gandakimun/widget/shimmer.dart';
//
// class WardOffices extends GetView<AppController> {
//   WardOffices({Key? key}) : super(key: key);
//
//   @override
//   final controller = Get.put(AppController());
//   final ourInformationController = Get.put(OurInformationController());
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ourInformationController.fetchWards();
//     });
//     return Scaffold(
//         backgroundColor: AppColor.backgroundClr,
//         appBar: buildAppbar(
//           controller.isNepali.value ? 'वडा कार्यालयहरु' : 'Ward Offices',
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               buildHeading(
//                 controller.isNepali.value
//                     ? 'वार्ड कार्यालयहरु'
//                     : 'Ward Offices',
//               ),
//               const SizedBox(height: 10),
//               ourInformationController.loadingWards.value==false
//                   ? ListView.builder(
//                       shrinkWrap: true,
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: ourInformationController.wardlist.length,
//                       itemBuilder: (context, index) {
//                         var data = ourInformationController.wardlist[index];
//                         return CustomTile(
//                             ontap: () {},
//                             title: controller.isNepali.value
//                                 ? data.title!.np.toString()
//                                 : data.title!.en.toString());
//                       })
//                   : Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: ListView.builder(
//                         itemCount: 10,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return const Skelton(
//                               height: 50, width: double.infinity);
//                         },
//                       ),
//                     ),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward1OfficersScreen());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '१ नं वडा कार्यालयहरु'
//               //         : "1 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward2OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '२ नं वडा कार्यालयहरु'
//               //         : "2 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward3OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '३ नं वडा कार्यालयहरु'
//               //         : "3 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward4OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '४ नं वडा कार्यालयहरु'
//               //         : "4 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward5OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '५ नं वडा कार्यालयहरु'
//               //         : "5 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward6OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '६ नं वडा कार्यालयहरु'
//               //         : "6 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward7OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '७ नं वडा कार्यालयहरु'
//               //         : "7 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward8OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '८ नं वडा कार्यालयहरु'
//               //         : "8 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward9OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '९ नं वडा कार्यालयहरु'
//               //         : "9 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward10OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '१० नं वडा कार्यालयहरु'
//               //         : "10 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward11OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '११ नं वडा कार्यालयहरु'
//               //         : "11 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward12OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '१२ नं वडा कार्यालयहरु'
//               //         : "12 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward13OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '१३ नं वडा कार्यालयहरु'
//               //         : "13 Ward Offices"),
//               // CustomTile(
//               //     ontap: () {
//               //       Get.to(Ward14OfficerDetails());
//               //     },
//               //     title: controller.isNepali.value
//               //         ? '१४ नं वडा कार्यालयहरु'
//               //         : "14 Ward Offices"),
//             ],
//           ),
//         ));
//   }
// }
