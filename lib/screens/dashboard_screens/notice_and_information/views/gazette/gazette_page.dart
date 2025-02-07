import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/gazette/widget/gazette_title_display.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';

class GezettePage extends StatefulWidget {
  const GezettePage({Key? key}) : super(key: key);

  @override
  State<GezettePage> createState() => _GezettePageState();
}

class _GezettePageState extends State<GezettePage> {
  var controller = Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchGezette();
    controller.fetchKhanda();
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchGezette();
    controller.fetchKhanda();
    var khandaList = controller.khandaList;
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(controller.isNepali.value ? 'राजपत्र' : 'Gezette'),
        body: SingleChildScrollView(
          child: Obx(
            () => controller.loading.value == true
                ? Skelton()
                : Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      buildHeading(
                          controller.isNepali.value ? 'राजपत्र' : 'Gezette'),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: khandaList.length,
                          itemBuilder: (context, index) {
                            var data = khandaList[index];
                            return Card(
                                child: ListTile(
                              onTap: () {
                                Get.to(GezetteTitleScreen(
                                  text: data.name!.en.toString(),
                                  // gazetteHeadingModel: data,
                                ));
                              },
                              title: Text(
                                controller.isNepali.value
                                    ? data.name!.np.toString()
                                    : data.name!.np.toString(),
                              ),
                            ));
                          })
                    ],
                  ),
          ),
        ));
  }

  openPdf(File file, String url) {
    Get.to(() => PdfWidget(
          file: file,
          url: url,
        ));
  }
}
