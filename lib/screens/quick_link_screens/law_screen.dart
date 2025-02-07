// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gandakimun/constants.dart';
// import 'package:gandakimun/controllers/appcontroller.dart';
// import 'package:gandakimun/model/law.dart';
// import 'package:gandakimun/widget/appbar.dart';
// import 'package:gandakimun/widget/custom_tile.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:gandakimun/widget/heading.dart';

// class LawScreen extends StatelessWidget {
//   LawScreen({Key? key}) : super(key: key);

//   final controller = Get.put(AppController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgroundClr,
//       appBar: buildAppbar(controller.isNepali.isTrue ? 'कानूनहरु' : 'laws'),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 buildAppbar(controller.isNepali.isTrue ? 'कानूनहरु' : 'laws'),
//                 SizedBox(
//                   height: 60,
//                   child: TextField(
//                     onChanged: (value) {},
//                     decoration: const InputDecoration(
//                       hintText: 'Search',
//                       contentPadding: EdgeInsets.symmetric(
//                           vertical: 10.0, horizontal: 20.0),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.lightBlueAccent, width: 1.0),
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.lightBlueAccent, width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Text('111')
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LawDetail extends StatelessWidget {
//   const LawDetail({Key? key, required this.data}) : super(key: key);

//   final LawData data;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppbar('Law Details'),
//       backgroundColor: AppColor.backgroundClr,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // buildHeading(data.lawName!.en.toString()),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(data.lawLevel!.en.toString()),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(data.lawType!.en.toString()),
//               const SizedBox(
//                 height: 10,
//               ),
//               Center(
//                 child: GestureDetector(
//                     onTap: () => Get.dialog(PhotoView(
//                         imageProvider: CachedNetworkImageProvider(
//                             data.file.toString()))),
//                     child:
//                         CachedNetworkImage(imageUrl: data.file.toString())),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
