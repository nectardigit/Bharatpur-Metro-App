import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/utils/pdf_api.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class WaterPage extends StatelessWidget {
  WaterPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = controller.waterList;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'पिउने पानी' : 'Water'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value ? 'पिउने पानी' : 'Water'),
          Obx(
            () => SizedBox(
              height: size.height * .8,
              width: size.width * .98,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        var url = list[index].file.toString();
                        final file = await PDFApi.loadNetwork(url);
                        openPdf(file,url);
                      },
                      child: CustomTile(
                        title: controller.isNepali.value
                            ? list[index].title!.np.toString()
                            : list[index].title!.en.toString(),
                        subtitle: list[index].date.toString(),
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

  openPdf(File file,String url) {
    Get.to(() => PdfWidget(
          file: file,
          url: url,
        ));
  }
}
