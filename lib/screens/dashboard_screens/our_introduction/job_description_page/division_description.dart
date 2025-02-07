import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/job_description_detail.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class DivisionDescriptionScreen extends StatelessWidget {
  DivisionDescriptionScreen({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<JobDescriptionHeaderModel> divisionDescriprion =
        controller.jobDescriptionList.where((e) => e.jdType == '2').toList();
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value ? 'विभाजन' : 'Division'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            divisionDescriprion.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: divisionDescriprion.length,
                    itemBuilder: (context, index) {
                      var data = divisionDescriprion[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTile(
                            ontap: () {
                              Get.to(JobDescriptionDetailScreen(
                                jobDescriptionHeaderModel: data,
                              ));
                            },
                            title: controller.isNepali.value
                                ? data.division!.np.toString()
                                : data.division!.en.toString()),
                      );
                    })
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: Text('No Data Here')),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
