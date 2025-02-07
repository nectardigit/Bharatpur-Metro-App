// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class StateOfConciliation extends StatefulWidget {
  const StateOfConciliation({Key? key}) : super(key: key);

  @override
  State<StateOfConciliation> createState() => _StateOfConciliationState();
}

class _StateOfConciliationState extends State<StateOfConciliation> {
  final controller = Get.put(AppController());
  @override
  void initState() {
    controller.getStateOfReconciliators();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'मेलमिलापको अवस्था'
          : 'State of Conciliation'),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.stateOfConciliatorsList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ...List.generate(
                          controller.stateOfConciliatorsList.length,
                          (index) => controller.stateOfConciliatorsList[index]
                                      .name!.np !=
                                  null
                              ? CustomTile(
                                  height: 70,
                                  leading: const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColor.primaryClr,
                                    child: Icon(Icons.location_city,
                                        color: Colors.white),
                                  ),
                                  title: controller
                                              .stateOfConciliatorsList[index]
                                              .name!
                                              .np !=
                                          null
                                      ? controller.isNepali.value
                                          ? controller
                                              .stateOfConciliatorsList[index]
                                              .name!
                                              .np
                                              .toString()
                                          : controller
                                              .stateOfConciliatorsList[index]
                                              .name!
                                              .en
                                              .toString()
                                      : '',
                                  subtitle: controller
                                              .stateOfConciliatorsList[index]
                                              .details!
                                              .np !=
                                          null
                                      ? controller.isNepali.value
                                          ? controller
                                              .stateOfConciliatorsList[index]
                                              .details!
                                              .np
                                              .toString()
                                          : controller
                                              .stateOfConciliatorsList[index]
                                              .details!
                                              .en
                                              .toString()
                                      : '',
                                  ontap: () {},
                                )
                              : const SizedBox())
                    ],
                  ),
                )
              : SizedBox(
                  height: size.height * .7,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }

  void _launchUrl(url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
