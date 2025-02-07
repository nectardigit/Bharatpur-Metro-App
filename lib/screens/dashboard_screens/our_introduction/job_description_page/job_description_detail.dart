import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/widget/appbar.dart';

class JobDescriptionDetailScreen extends StatelessWidget {
  JobDescriptionDetailScreen(
      {Key? key, required this.jobDescriptionHeaderModel});
  final JobDescriptionHeaderModel jobDescriptionHeaderModel;
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? 'कार्य विवरण' : 'Job description'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Html(
                  data: controller.isNepali.value
                      ? jobDescriptionHeaderModel.title!.np.toString()
                      : jobDescriptionHeaderModel.title!.en.toString(),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Html(
                  data: controller.isNepali.value
                      ? jobDescriptionHeaderModel.details!.np.toString()
                      : jobDescriptionHeaderModel.details!.en.toString(),
                ))
          ],
        ),
      ),
    );
  }
}
