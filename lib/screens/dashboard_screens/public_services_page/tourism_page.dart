import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/public_service.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

import 'widget/service_category_fileOpen.dart';

class TourismPage extends StatelessWidget {
  TourismPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<PublicSericeHeadingModel> tourismService = controller.publicService
        .where((e) => e.serviceCategoryId! == 3)
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'पर्यटन' : 'Tourism'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value ? 'पर्यटन' : 'Tourism'),
          ListView.builder(
              shrinkWrap: true,
              itemCount: tourismService.length,
              itemBuilder: (context, index) {
                var data = tourismService[index];
                return CustomTile(
                  ontap: () {
                    Get.to(PublicServiceFileOpen(
                      publicSericeHeadingModel: data,
                      text: controller.isNepali.value ? 'पर्यटन' : 'Tourism',
                    ));
                  },
                  height: 70,
                  title: controller.isNepali.value
                      ? data.title!.np.toString()
                      : data.title!.en.toString(),
                  subtitle: data.createdAt,
                  trailing: const Icon(Icons.picture_as_pdf),
                );
              }),
          // Obx(
          //   () => SizedBox(
          //     height: size.height * .8,
          //     width: size.width * .98,
          //     child: ListView.builder(
          //       itemCount: list.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.all(10),
          //           child: GestureDetector(
          //             onTap: () async {
          //               var url = list[index].files.toString();
          //               final file = await PDFApi.loadNetwork(url);
          //               openPdf(file,url);
          //             },
          //             child: CustomTile(
          //               title: controller.isNepali.value
          //                   ? list[index].title.np.toString()
          //                   : list[index].title.en.toString(),
          //               subtitle: controller.isNepali.value
          //                   ? list[index].details.np.toString()
          //                   : list[index].details.en.toString(),
          //               trailing: const Icon(Icons.picture_as_pdf_rounded),
          //             ),
          //           ),
          //         );
          //       },
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
