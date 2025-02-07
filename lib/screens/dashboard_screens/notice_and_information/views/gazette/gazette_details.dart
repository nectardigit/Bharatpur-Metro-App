import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import 'package:gandakimun/model/gazette_model.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GazetteDetailsScreen extends StatelessWidget {
  GazetteDetailsScreen({Key? key, required this.data}) : super(key: key);
  final controller = Get.put(AppController());
  final GazetteHeadingModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? data.title!.np.toString()
          : data.title!.en.toString()),
      body: controller.budgetlist.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.isNepali.value
                                    ? data.title!.np.toString()
                                    : data.title!.en.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(35, 74, 131, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          DioFileDownlaod()
                              .startDownloading(data.files!, context);
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  data.publishedDate != null
                      ? Text('Submmited on: ${data.publishedDate.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (data.files == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (data.files != null)
                    data.files!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              data.files!.toString(),
                            ),
                          )
                        : Image.network(data.files!.toString())
                ],
              ),
            )
          : buildNodata(),
    );
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
