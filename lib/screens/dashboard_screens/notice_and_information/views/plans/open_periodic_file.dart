import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/periodic_plan_model.dart';
import 'package:gandakimun/utils/file_download.dart';

import 'package:gandakimun/widget/nodata.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PlanDetailScreen extends StatefulWidget {
  const PlanDetailScreen({Key? key, required this.planCategoryHeadingModel});
  final PlanCategoryHeadingModel planCategoryHeadingModel;

  @override
  State<PlanDetailScreen> createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  final controller = Get.put(AppController());
  Dio dio = Dio();
  String progress = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isNepali.value
            ? widget.planCategoryHeadingModel.title!.np.toString()
            : widget.planCategoryHeadingModel.title!.en.toString()),
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
                                    ? widget.planCategoryHeadingModel.title!.np
                                        .toString()
                                    : widget.planCategoryHeadingModel.title!.en
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
                                widget.planCategoryHeadingModel.files!,
                                context);
                          });
                        },
                        icon: const Material(
                            color: Colors.transparent,
                            child: Icon(Icons.download)),
                      )
                    ],
                  ),
                  widget.planCategoryHeadingModel.date != null
                      ? Text(
                          'Submmited on: ${widget.planCategoryHeadingModel.date.toString()}',
                          style: subtitleStyle)
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  if (widget.planCategoryHeadingModel.files == null)
                    const Center(
                      child: Text('No Files Found'),
                    ),
                  if (widget.planCategoryHeadingModel.files != null)
                    widget.planCategoryHeadingModel.files!.endsWith('.pdf')
                        ? Expanded(
                            child: SfPdfViewer.network(
                              widget.planCategoryHeadingModel.files!,
                            ),
                          )
                        : Image.network(
                            widget.planCategoryHeadingModel.files.toString())
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
