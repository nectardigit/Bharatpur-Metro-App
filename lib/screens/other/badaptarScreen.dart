// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';

// import '../../constants.dart';
// import '../../controllers/appcontroller.dart';
// import '../../widget/appbar.dart';
// import '../../widget/nodata.dart';

// class BadaPatraScreen extends StatelessWidget {
//   BadaPatraScreen({Key? key}) : super(key: key);
//    final controller = Get.put(AppController());
//   final ourInformationController = Get.put(OurInformationController());

//   @override
//   Widget build(BuildContext context) {
//     log(ourInformationController.civilWardPaperList.toString());
//     return Scaffold(
//       backgroundColor: AppColor.backgroundClr,
//       appBar: buildAppbar('बडा पत्र '),
//       body: SingleChildScrollView(
//           child: Obx(() => !ourInformationController
//                   .civilWardPaperList.isNotEmpty
//               ? Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       ListView.separated(
//                         separatorBuilder: (context, index) => Container(
//                           height: 10,
//                         ),
//                         // itemCount: controller.badaPatraList.length,
//                         itemCount: 5,

//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: (() {}),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               blurRadius: 10,
//                                               color: Colors.grey,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     child: Column(
//                                       children: const [
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text("सेवाहरु"),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               "उद्योग व्यवसाय ठाउँसारी प्रमाणित/ सिफारिस"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               blurRadius: 10,
//                                               color: Colors.grey,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     child: Column(
//                                       children: const [
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text("सेवाहरु"),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               "उद्योग व्यवसाय ठाउँसारी प्रमाणित/ सिफारिस"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               blurRadius: 10,
//                                               color: Colors.grey,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     child: Column(
//                                       children: const [
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text("सेवाहरु"),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               "उद्योग व्यवसाय ठाउँसारी प्रमाणित/ सिफारिस"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               blurRadius: 10,
//                                               color: Colors.grey,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     child: Column(
//                                       children: const [
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text("सेवाहरु"),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               "उद्योग व्यवसाय ठाउँसारी प्रमाणित/ सिफारिस"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               blurRadius: 10,
//                                               color: Colors.grey,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     child: Column(
//                                       children: const [
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text("सेवाहरु"),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               "उद्योग व्यवसाय ठाउँसारी प्रमाणित/ सिफारिस"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: const [
//                                           BoxShadow(
//                                               blurRadius: 10,
//                                               color: Colors.grey,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     child: Column(
//                                       children: const [
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text("सेवाहरु"),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               "उद्योग व्यवसाय ठाउँसारी प्रमाणित/ सिफारिस"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       // ...List.generate(
//                       //     controller.taxlist.length,
//                       //     (index) => controller.taxlist[index].status == 1
//                       //         ? InkWell(
//                       //             onTap: () {
//                       //               // Get.to(() => NagarpalikaDetail(
//                       //               //       data: controller
//                       //               //           .municipalitylist[index],
//                       //               //     ));
//                       //             },
//                       //             child: Container(
//                       //                 height: 50,
//                       //                 width: double.infinity,
//                       //                 margin: const EdgeInsets.all(5),
//                       //                 padding: const EdgeInsets.all(10),
//                       //                 decoration: BoxDecoration(
//                       //                     color: Colors.white,
//                       //                     boxShadow: [buildBoxShadow()]),
//                       //                 child: Align(
//                       //                     alignment: Alignment.centerLeft,
//                       //                     child: Text(
//                       //                       controller.taxlist[index].title!.np
//                       //                           .toString(),
//                       //                       style: subtitleStyle,
//                       //                     ))),
//                       //           )
//                       //         : Container())
//                     ],
//                   ),
//                 )
//               : Center(
//                   child: buildNodata(),
//                 ))
//           // Column(
//           //   children: [
//           //     const SizedBox(
//           //       height: 20,
//           //     ),
//           //     ...List.generate(5, (index) => buildTile())
//           //   ],
//           // ),
//           ),
//     );
//   }
// }
