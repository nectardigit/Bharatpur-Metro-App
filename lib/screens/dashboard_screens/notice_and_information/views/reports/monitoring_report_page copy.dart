// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/report_details.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class MonitoringReportPage extends StatelessWidget {
  MonitoringReportPage({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = controller.monitoringReportDataList;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'अनुगमन प्रतिवेदन' : 'Monitoring Report'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(
              controller.isNepali.value ? 'अनुगमन प्रतिवेदन' : 'Audit Report'),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: ()  {
                        Get.to(ReportDetailScreen(
                          reportHeadingModel: list[index],
                        ));
                      },
                      child: CustomTile(
                        height: 70,
                        title: controller.isNepali.value
                            ? list[index].title!.np.toString()
                            : list[index].title!.en.toString(),
                        // 'Annual Report',
                        subtitle: list[index].date.toString().split(' ')[0],
                        trailing: const Icon(Icons.arrow_right_alt),
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
