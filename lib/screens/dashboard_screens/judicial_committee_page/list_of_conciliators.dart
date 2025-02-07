// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ListOfConcilators extends StatefulWidget {
  const ListOfConcilators({Key? key}) : super(key: key);

  @override
  State<ListOfConcilators> createState() => _ListOfConcilatorsState();
}

class _ListOfConcilatorsState extends State<ListOfConcilators> {
  final controller = Get.put(AppController());

  @override
  void initState() {
    controller.getListOfReconciliators();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'मेलमिलापकर्ताहरुको सुची'
          : 'List of Conciliators'),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.listOfConciliatorsList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ...List.generate(
                          controller.listOfConciliatorsList.length,
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
                                        .listOfConciliatorsList[index].name!.np
                                        .toString()
                                    : controller
                                        .listOfConciliatorsList[index].name!.en
                                        .toString(),
                                // subtitle: controller.isNepali.value
                                //     ? controller.listOfConciliatorsList[index]
                                //         .details!.np
                                //         .toString()
                                //     : controller.listOfConciliatorsList[index]
                                //         .details!.en
                                //         .toString(),
                                ontap: () {},
                              ))
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
