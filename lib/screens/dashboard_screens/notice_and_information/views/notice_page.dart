import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/home/notice_details.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

import '../../../scroll_controller.dart';

class NoticePage extends StatelessWidget {
  NoticePage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var list = controller.noticeList;
    final BottomNavigationController scrollControllerNew =
    Get.put(BottomNavigationController());

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        scrollControllerNew.hide();
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        scrollControllerNew.show();
      }
    });
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'समाचार र सूचना' : 'News and Notice'),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            buildHeading(controller.isNepali.value ? 'सुचना' : 'Notice'),
            Obx(
                  () => ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
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
            )
          ],
        ),
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
