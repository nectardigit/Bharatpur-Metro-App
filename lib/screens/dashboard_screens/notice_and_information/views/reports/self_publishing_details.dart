import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import 'package:gandakimun/model/self_publishing_model.dart';
import 'package:gandakimun/widget/nodata.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SelfPublishingDetailScreen extends StatefulWidget {
  const SelfPublishingDetailScreen(
      {Key? key, required this.selfPublishingHeadingModel});
  final SelfPublishingHeadingModel selfPublishingHeadingModel;

  @override
  State<SelfPublishingDetailScreen> createState() =>
      _SelfPublishingDetailScreenState();
}

class _SelfPublishingDetailScreenState
    extends State<SelfPublishingDetailScreen> {
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value
            ? widget.selfPublishingHeadingModel.title!.np.toString()
            : widget.selfPublishingHeadingModel.title!.en.toString()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 10,
            ),
            child: widget.selfPublishingHeadingModel.date == null
                ? const SizedBox()
                : Text(
                    widget.selfPublishingHeadingModel.date.toString(),
                    textScaleFactor: 1,
                  ),
          )
        ],
      ),
      body: widget.selfPublishingHeadingModel.files != null
          ? SizedBox(
              height: double.infinity,
              child: widget.selfPublishingHeadingModel.files!.endsWith('.pdf')
                  ? SfPdfViewer.network(
                      "https://gandakimun.amritsparsha.com/${widget.selfPublishingHeadingModel.files}",
                    )
                  : Image.network(
                      widget.selfPublishingHeadingModel.files.toString()),
            )
          : buildNodata(),
    );
  }
}
