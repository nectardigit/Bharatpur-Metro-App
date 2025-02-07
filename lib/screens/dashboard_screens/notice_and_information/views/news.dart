import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/home/notice_details.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = controller.noticeList;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'सुचना' : 'News'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value ? 'सुचना' : 'Notice'),
          Obx(
            () => SizedBox(
              height: size.height * .8,
              width: size.width * .98,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var datas = list[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        Get.to(NoticeDetailScreen(noticeHeadingModel: datas));
                      },
                      child: CustomTile(
                        height: 80,
                        title: controller.isNepali.value
                            ? datas.title!.np.toString()
                            : datas.title!.en.toString(),
                        subtitle: datas.createdAt,
                        trailing: const Icon(Icons.picture_as_pdf_rounded),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
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
