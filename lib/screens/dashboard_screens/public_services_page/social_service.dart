import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/public_service.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/widget/service_category_fileOpen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class SocialServicePage extends StatelessWidget {
  SocialServicePage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<PublicSericeHeadingModel> socialService = controller.publicService
        .where((e) => e.serviceCategoryId! == 10)
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'कृषि' : 'Agriculture'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value ? 'कृषि' : 'Agriculture'),
          socialService.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: socialService.length,
                  itemBuilder: (context, index) {
                    var data = socialService[index];
                    return CustomTile(
                      ontap: () {
                        Get.to(PublicServiceFileOpen(
                          publicSericeHeadingModel: data,
                          text: controller.isNepali.value
                              ? 'कृषि'
                              : 'Agriculture',
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
          //               var url = list[index].file.toString();
          //               final file = await PDFApi.loadNetwork(url);
          //               openPdf(file,url);
          //             },
          //             child: CustomTile(
          //               title: controller.isNepali.value
          //                   ? list[index].title.np.toString()
          //                   : list[index].title.en.toString(),
          //               subtitle: list[index].date.toString(),
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
