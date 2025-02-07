import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/document_notice.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'dart:developer';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({Key? key, required this.noticeHeadingModel})
      : super(key: key);

  final NoticeHeadingModel noticeHeadingModel;

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    log(widget.noticeHeadingModel.title.toString());
    log(widget.noticeHeadingModel.id.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value ? 'सुचना' : 'Notice'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 20,
            ),
            child: Text(
              widget.noticeHeadingModel.createdAt.toString(),
              textScaler: const TextScaler.linear(1.2),
            ),
          )
        ],
      ),
      body: widget.noticeHeadingModel.files!.isNotEmpty
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
                                widget.noticeHeadingModel.title != null
                                    ? controller.isNepali.value
                                        ? widget.noticeHeadingModel.title!.np
                                            .toString()
                                        : widget.noticeHeadingModel.title!.en
                                            .toString()
                                    : '',
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
                                widget.noticeHeadingModel.files!, context);
                          });
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  widget.noticeHeadingModel.createdAt != null
                      ? Text(
                          'Submited on: ${widget.noticeHeadingModel.createdAt.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.noticeHeadingModel.files == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (widget.noticeHeadingModel.files != null)
                    widget.noticeHeadingModel.files!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              widget.noticeHeadingModel.files!,
                            ),
                          )
                        : Image.network(
                            widget.noticeHeadingModel.files.toString())
                ],
              ),
            )
          : buildNodata(),
    );
  }
}
