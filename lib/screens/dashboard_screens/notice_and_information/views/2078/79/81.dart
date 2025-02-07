import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/self_publishing_model.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/2078/79.details.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:get/get.dart';

class SelfPublishingHeadingScreen extends StatelessWidget {
  SelfPublishingHeadingScreen({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<SelfPublishingHeadingModel> selfPublishing = controller
        .selfPublishingList
        .where((e) => e.fiscalYear == 'आ.ब. २०८०/०८१')
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'स्वत:प्रकाशन' : 'Self Publishing'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            selfPublishing.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: selfPublishing.length,
                    itemBuilder: (context, index) {
                      var data = selfPublishing[index];
                      return data.period == null
                          ? const SizedBox()
                          : CustomTile(
                              ontap: () {
                                Get.to(SelfPublishingDetailScreen(
                                  data: data,
                                ));
                              },
                              title: controller.isNepali.value
                                  ? data.period!.np.toString()
                                  : data.period!.en.toString(),
                            );
                    })
                : buildNodata(),
          ],
        ),
      ),
    );
  }
}
