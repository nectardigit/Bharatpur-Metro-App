import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/model/tax.dart';
import 'package:gandakimun/utils/pdf_api.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/drawer.dart';
import 'package:gandakimun/widget/pdf_widget.dart';

class TaxScreen extends StatelessWidget {
  const TaxScreen({Key? key, required this.data}) : super(key: key);

  final TaxData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar('कर तथा दस्तुर'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeading(controller.isNepali.value
                ? data.title!.np.toString()
                : data.title!.en.toString()),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          controller.isNepali.value
                              ? 'कानूनको प्रकार:\n ${data.lawType!.np ?? "-"}'
                              : 'Type of Law:\n ${data.lawType!.en ?? "-"}',
                          style: subtitleStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          controller.isNepali.value
                              ? 'कानूनको तह:\n ${data.lawLevel!.np ?? '-'}'
                              : 'Legislation::\n ${data.lawLevel!.en ?? '-'}',
                          style: subtitleStyle),
                      Text(
                          controller.isNepali.value
                              ? 'ट्यागहरू:\n ${data.tags!.np.toString()}'
                              : 'Tags:\n ${data.tags!.en.toString()}',
                          style: subtitleStyle),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Center(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  icon: const Icon(Icons.picture_as_pdf),
                  onPressed: () async {
                    var url = data.document.toString();
                    final file = await PDFApi.loadNetwork(url);
                    openPdf(file, url);
                  },
                  label: Text(
                    controller.isNepali.value
                        ? 'कागजात हेर्नुहोस्'
                        : 'See Document',
                    style: subtitleStyle.copyWith(
                        fontSize: 18.sp, color: Colors.white),
                  )),
            ),
          ],
        ),
      )),
    );
  }

  openPdf(File file, String url) {
    Get.to(() => PdfWidget(
          file: file,
          url: url,
        ));
  }

  _buildHeading(title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString().toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(35, 74, 131, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: AppColor.red,
            thickness: 3,
            endIndent: Device.orientation == Orientation.portrait ? 300 : 650,
          )
        ],
      ),
    );
  }
}
