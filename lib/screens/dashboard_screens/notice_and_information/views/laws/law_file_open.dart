import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/law.dart';
import 'package:gandakimun/utils/file_download.dart';

import 'package:gandakimun/widget/nodata.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

class LawLocalDetailScreen extends StatefulWidget {
  const LawLocalDetailScreen({Key? key, required this.lawData});
  final LawData lawData;

  @override
  State<LawLocalDetailScreen> createState() => _LawLocalDetailScreenState();
}

class _LawLocalDetailScreenState extends State<LawLocalDetailScreen> {
  final controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value
            ? widget.lawData.title!.np.toString()
            : widget.lawData.title!.en.toString()),
      ),
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
                                    ? widget.lawData.title!.np.toString()
                                    : widget.lawData.title!.en.toString(),
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
                              .startDownloading(widget.lawData.file!, context);
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  widget.lawData.published != null
                      ? Text(
                          'Submmited on: ${widget.lawData.published.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.lawData.file == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (widget.lawData.file != null)
                    widget.lawData.file!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              widget.lawData.file.toString(),
                            ),
                          )
                        : Image.network(widget.lawData.file.toString())
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
