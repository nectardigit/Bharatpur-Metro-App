import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/public_service.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

import 'widget/service_category_fileOpen.dart';

class GarbageManagementPage extends StatelessWidget {
  GarbageManagementPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<PublicSericeHeadingModel> garbageService = controller.publicService
        .where((e) => e.serviceCategoryId! == 7)
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'फोहोर व्यवस्थापन' : 'GarbageManagement'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value
              ? 'फोहोर व्यवस्थापन'
              : 'GarbageManagement'),
          // GarbageHeaderWidget(),
          garbageService.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: garbageService.length,
                  itemBuilder: (context, index) {
                    var data = garbageService[index];
                    return CustomTile(
                      ontap: () {
                        Get.to(PublicServiceFileOpen(
                          publicSericeHeadingModel: data,
                          text: controller.isNepali.value
                              ? 'फोहोर व्यवस्थापन'
                              : 'GarbageManagement',
                        ));
                      },
                      height: 70,
                      title: controller.isNepali.value
                          ? data.title!.np.toString()
                          : data.title!.en.toString(),
                      subtitle: data.createdAt,
                      trailing: const Icon(Icons.picture_as_pdf),
                    );
                  })
              : buildNodata(),
          // Obx(
          //   () => Expanded(
          //     child: SingleChildScrollView(
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: list.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             color: Colors.white,
          //             width: size.width * 1.4,
          //             height: size.height * 0.04,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: <Widget>[
          //                 Container(
          //                   padding: const EdgeInsets.all(2),
          //                   width: size.width * 0.4,
          //                   child: Text(
          //                       controller.isNepali.value
          //                           ? list[index].day.np ?? '-'
          //                           : list[index].day.en ?? '-',
          //                       textAlign: TextAlign.start,
          //                       style: subtitleStyle),
          //                 ),
          //                 Container(
          //                   padding: const EdgeInsets.all(2),
          //                   width: size.width * 0.5,
          //                   child: Text(
          //                       controller.isNepali.value
          //                           ? list[index].toll.np ?? '-'
          //                           : list[index].toll.en ?? '-',
          //                       textAlign: TextAlign.start,
          //                       style: subtitleStyle),
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  openPdf(File file, String url) {
    Get.to(() => PdfWidget(
          file: file,
          url: url,
        ));
  }
}
