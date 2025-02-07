// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gandakimun/controllers/appcontroller.dart';
// import 'package:gandakimun/widget/appbar.dart';
// import 'package:gandakimun/widget/custom_tile.dart';

// class SearchLaw extends StatefulWidget {
//  const  SearchLaw({Key? key});

//   @override
//   State<SearchLaw> createState() => _SearchLawState();
// }

// class _SearchLawState extends State<SearchLaw> {
//   final controller = Get.put(AppController());

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         physics: const BouncingScrollPhysics(),
//         itemCount: controller.searchlaws.length,
//         itemBuilder: (context, index) {
//           var data = controller.searchlaws[index];
//           return GestureDetector(
//               onTap: () {},
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 05.0),
//                 child: CustomTile(
//                   height: 70,
//                   title: controller.isNepali.value
//                       ? data.title!.np.toString()
//                       : data.title!.en.toString(),
//                 ),
//               ));
//         });
//   }
// }
