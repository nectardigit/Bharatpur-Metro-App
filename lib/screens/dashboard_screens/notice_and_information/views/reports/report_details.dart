import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import 'package:gandakimun/model/reports_model.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/nodata.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({Key? key, required this.reportHeadingModel});
  final ReportHeadingModel reportHeadingModel;

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value
            ? widget.reportHeadingModel.title!.np.toString()
            : widget.reportHeadingModel.title!.en.toString()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 10,
            ),
            child: Text(
              widget.reportHeadingModel.date.toString(),
              textScaleFactor: 1,
            ),
          )
        ],
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
                                    ? widget.reportHeadingModel.title!.np
                                        .toString()
                                    : widget.reportHeadingModel.title!.en
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
                          setState(() {
                            DioFileDownlaod().startDownloading(
                                widget.reportHeadingModel.files!, context);
                          });
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  widget.reportHeadingModel.date != null
                      ? Text(
                          'Submmited on: ${widget.reportHeadingModel.date.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.reportHeadingModel.files == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (widget.reportHeadingModel.files != null)
                    widget.reportHeadingModel.files!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              widget.reportHeadingModel.files!,
                            ),
                          )
                        : Image.network(
                            widget.reportHeadingModel.files.toString())
                ],
              ),
            )
          : buildNodata(),
    );
  }
}
