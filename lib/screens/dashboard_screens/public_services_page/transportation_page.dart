import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/public_service.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/widget/service_category_fileOpen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/pdf_widget.dart';
import 'package:get/get.dart';

class PublicServices extends StatelessWidget {
  String category;

  PublicServices({Key? key, required this.category});

  final controller = Get.put(AppController());

  initState() {
    if (kDebugMode) {
      print("hi anish$category");
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    List<PublicSericeHeadingModel> publicService = controller.publicService
        .where((e) => e.serviceCategoryName!.np == category.toString())
        .toList();
    List<PublicSericeHeadingModel> publicServiceEng = controller.publicService
        .where((e) => e.serviceCategoryName!.en == category.toString())
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(category.toString()),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(category.toString()),
          controller.isNepali.value
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: publicService.length,
                  itemBuilder: (context, index) {
                    var data = publicService[index];
                    return CustomTile(
                      ontap: () {
                        Get.to(PublicServiceFileOpen(
                          publicSericeHeadingModel: data,
                          text: category,
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
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: publicServiceEng.length,
                  itemBuilder: (context, index) {
                    var data = publicServiceEng[index];
                    return CustomTile(
                      ontap: () {
                        Get.to(PublicServiceFileOpen(
                          publicSericeHeadingModel: data,
                          text: category,
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
