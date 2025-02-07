import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/general_purchase.dart';
import 'package:gandakimun/utils/file_download.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GeneralPurchaseDetail extends StatefulWidget {
  const GeneralPurchaseDetail({Key? key, required this.data}) : super(key: key);
  final GeneralServiceHeadingModel data;

  @override
  State<GeneralPurchaseDetail> createState() => _GeneralPurchaseDetailState();
}

class _GeneralPurchaseDetailState extends State<GeneralPurchaseDetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value
          ? widget.data.title!.np.toString()
          : widget.data.title!.en.toString()),
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
                                    ? widget.data.title!.np.toString()
                                    : widget.data.title!.en.toString(),
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
                  widget.data.published != null
                      ? Text(
                          'Submmited on: ${widget.data.published.toString()}',
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
}
