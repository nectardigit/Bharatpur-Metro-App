import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/job_description_detail.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class SectionDescriptionScreen extends StatelessWidget {
  SectionDescriptionScreen({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<JobDescriptionHeaderModel> sectionDescriprion =
        controller.jobDescriptionList.where((e) => e.jdType == '3').toList();
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value ? 'खण्ड' : 'Section'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sectionDescriprion.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: sectionDescriprion.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = sectionDescriprion[index];
                      return data.branch!.np != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTile(
                                  ontap: () {
                                    Get.to(JobDescriptionDetailScreen(
                                      jobDescriptionHeaderModel: data,
                                    ));
                                  },
                                  title: data.branch!.np != null
                                      ? controller.isNepali.value
                                          ? data.branch!.np.toString()
                                          : data.branch!.en.toString()
                                      : ''),
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
