import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/job_description_detail.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class OfficeDescriptionScreen extends StatelessWidget {
  OfficeDescriptionScreen({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<JobDescriptionHeaderModel> jobdescriprion =
        controller.jobDescriptionList.where((e) => e.jdType == '1').toList();
    controller.fetchJobDescription();
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value ? 'कार्यालय' : 'Office'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            jobdescriprion.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: jobdescriprion.length,
                    itemBuilder: (context, index) {
                      var data = jobdescriprion[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTile(
                            ontap: () {
                              Get.to(JobDescriptionDetailScreen(
                                jobDescriptionHeaderModel: data,
                              ));
                            },
                            title: controller.isNepali.value
                                ? data.office!.np.toString()
                                : data.office!.en.toString()),
                      );
                    })
                : buildNodata(),
          ],
        ),
      ),
    );
  }
}
