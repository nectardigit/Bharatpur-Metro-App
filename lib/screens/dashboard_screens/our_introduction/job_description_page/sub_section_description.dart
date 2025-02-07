import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/job_description_detail.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class SubSectionDescriptionScreen extends StatelessWidget {
  SubSectionDescriptionScreen({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<JobDescriptionHeaderModel> subsectionDescriprion =
        controller.jobDescriptionList.where((e) => e.jdType == '4').toList();
    return Scaffold(
      appBar:
          buildAppbar(controller.isNepali.value ? 'उप-खण्ड' : 'Sub-Section'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            subsectionDescriprion.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: subsectionDescriprion.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = subsectionDescriprion[index];
                      return data.subDivision!.np != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTile(
                                  ontap: () {
                                    Get.to(JobDescriptionDetailScreen(
                                      jobDescriptionHeaderModel: data,
                                    ));
                                  },
                                  title: controller.isNepali.value
                                      ? data.subDivision!.np.toString()
                                      : data.subDivision!.en.toString()),
                            )
                          : const SizedBox();
                    })
                : buildNodata(),
          ],
        ),
      ),
    );
  }
}
