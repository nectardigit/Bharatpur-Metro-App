import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/ward_offices/ward_members_details.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../controllers/appcontroller.dart';
import '../../../../widget/appbar.dart';
import '../../../../widget/custom_tile.dart';
import '../../../../widget/heading.dart';
import '../controller/our_information.dart';

class WardOffices extends StatefulWidget {
  const WardOffices({Key? key}) : super(key: key);

  @override
  State<WardOffices> createState() => _WardOfficesState();
}

class _WardOfficesState extends State<WardOffices> {
  final controller = Get.put(AppController());
  final ourInformationController = Get.put(OurInformationController());

  @override
  void initState() {
    super.initState();
    // ourInformationController.fetchWards();
  }

  @override
  Widget build(BuildContext context) {
    ourInformationController.fetchWards();
    log(ourInformationController.wardlist.length.toString());

    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
          controller.isNepali.value ? 'वडा कार्यालयहरु' : 'Ward Offices',
        ),
        body: Obx(() => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  buildHeading(
                    controller.isNepali.value
                        ? 'वार्ड कार्यालयहरु'
                        : 'Ward Offices',
                  ),
                  const SizedBox(height: 10),
                  ourInformationController.loadingWards.value == true
                      ? const LinearProgressIndicator()
                      : Column(
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    ourInformationController.wardlist.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      ourInformationController.wardlist[index];
                                  print(
                                      "ward info ${ourInformationController.wardlist[index].title!.en}");
                                  return CustomTile(
                                      ontap: () {
                                        Get.to(WardMembersDetails(
                                            wardId: data.toString(),
                                            wardEnglish:
                                                data.title!.en.toString(),
                                            wardNepali:
                                                data.title!.np.toString()));
                                      },
                                      title: controller.isNepali.value
                                          ? data.title!.np.toString()
                                          : data.title!.en.toString());
                                }),
                          ],
                        )
                ],
              ),
            )));
  }
}
