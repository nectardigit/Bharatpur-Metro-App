// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ConciliationCenters extends StatefulWidget {
  const ConciliationCenters({Key? key}) : super(key: key);

  @override
  State<ConciliationCenters> createState() => _ConciliationCentersState();
}

class _ConciliationCentersState extends State<ConciliationCenters> {
  final controller = Get.put(AppController());
  @override
  void initState() {
    controller.getReconciliations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'मेलमिलाप केन्द्रहरु'
          : 'Conciliation Centres'),
      body: SingleChildScrollView(
        child: Obx(() => controller.reconciliationList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ...List.generate(
                        controller.reconciliationList.length,
                        (index) => CustomTile(
                              height: 70,
                              leading: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColor.primaryClr,
                                child: Icon(Icons.location_city,
                                    color: Colors.white),
                              ),
                              title: controller.isNepali.value
                                  ? controller
                                      .reconciliationList[index].name!.np
                                      .toString()
                                  : controller
                                      .reconciliationList[index].name!.en
                                      .toString(),
                              subtitle: controller.reconciliationList[index]
                                          .details!.np !=
                                      null
                                  ? controller.isNepali.value
                                      ? controller
                                          .reconciliationList[index].details!.np
                                          .toString()
                                      : controller
                                          .reconciliationList[index].details!.en
                                          .toString()
                                  : '',
                              ontap: () {},
                            ))
                  ],
                ),
              )
            : Container()),
      ),
    );
  }

  void _launchUrl(url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
