import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/utils/pdf_api.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class PlanningAndProject extends StatelessWidget {
  PlanningAndProject({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar('योजना हर्नुहोस'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('कृपया कुनै छान्नुहोस् ',
                style: subtitleStyle.copyWith(color: Colors.blueGrey)),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'छान्नुहोस्',
                    style: subtitleStyle,
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customButton('हर्नुहोस', () async {
              // Get.to(() => const PdfWidget());
              const url =
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';
              final file = await PDFApi.loadNetwork(url);
              openPdf(file,url);
            }),
            // Obx(
            //   () => GridView.builder(
            //     padding: const EdgeInsets.all(20),
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 5.0,
            //       mainAxisSpacing: 5.0,
            //     ),
            //     itemCount: title.length,
            //     itemBuilder: (context, indexx) {
            //       return DashboardCard(
            //           img: img[indexx],
            //           title: controller.isNepali.value
            //               ? nptitle[indexx]
            //               : title[indexx],
            //           ontap: () {});
            //     },
            //   ),
            // ),
          ],
        ),
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
