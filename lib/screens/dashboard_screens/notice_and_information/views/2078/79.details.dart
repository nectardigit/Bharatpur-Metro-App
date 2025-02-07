import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import 'package:gandakimun/model/self_publishing_model.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SelfPublishingDetailScreen extends StatefulWidget {
  SelfPublishingDetailScreen({Key? key, required this.data}) : super(key: key);
  final SelfPublishingHeadingModel data;

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
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? widget.data.period!.np.toString()
          : widget.data.period!.en.toString()),
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
                                    ? widget.data.period!.np.toString()
                                    : widget.data.period!.en.toString(),
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
                            DioFileDownlaod()
                                .startDownloading(widget.data.files!, context);
                          });
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  widget.data.date != null
                      ? Text('Submmited on: ${widget.data.date.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.data.files == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (widget.data.files != null)
                    widget.data.files!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              widget.data.files!,
                            ),
                          )
                        : Image.network(widget.data.files.toString())
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
