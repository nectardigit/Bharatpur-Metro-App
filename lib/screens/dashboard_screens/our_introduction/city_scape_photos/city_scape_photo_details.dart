import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/cityScapeModel.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/nodata.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CityScapeDetailScreen extends StatefulWidget {
  const CityScapeDetailScreen({Key? key, required this.cityScapeHeadingModel});
  final CityScapeHeadingModel cityScapeHeadingModel;

  @override
  State<CityScapeDetailScreen> createState() => _CityScapeDetailScreenState();
}

class _CityScapeDetailScreenState extends State<CityScapeDetailScreen> {
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isNepali.value ? 'नगर पार्श्व चित्र' : "CityScape Photos",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 10,
            ),
            child: Text(
              widget.cityScapeHeadingModel.createdAt.toString(),
              textScaleFactor: 1,
            ),
          )
        ],
      ),
      body: controller.cityScapeList.isNotEmpty
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
                                    ? widget.cityScapeHeadingModel.title!.np
                                        .toString()
                                    : widget.cityScapeHeadingModel.title!.en
                                        .toString(),
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
                          DioFileDownlaod().startDownloading(
                              widget.cityScapeHeadingModel.document!, context);
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  widget.cityScapeHeadingModel.createdAt != null
                      ? Text(
                          'Submmited on: ${widget.cityScapeHeadingModel.createdAt.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.cityScapeHeadingModel.document == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (widget.cityScapeHeadingModel.document != null)
                    widget.cityScapeHeadingModel.document!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              widget.cityScapeHeadingModel.document.toString(),
                            ),
                          )
                        : Image.network(
                            widget.cityScapeHeadingModel.document.toString())
                ],
              ),
            )
          : buildNodata(),
    );
  }
}
