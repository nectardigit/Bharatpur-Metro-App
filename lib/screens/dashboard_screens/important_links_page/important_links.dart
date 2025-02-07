// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ImportantLinkScreen extends StatelessWidget {
  ImportantLinkScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'महत्वपूर्ण लिन्कहरु हेर्नुहोस्'
          : 'Essential Links'),
      body: SingleChildScrollView(
        child: Obx(() => controller.importantLinklist.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ...List.generate(
                        controller.importantLinklist.length,
                        (index) => CustomTile(
                              height: 70,
                              leading: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColor.primaryClr,
                                child: Icon(Icons.link, color: Colors.white),
                              ),
                              title: controller.isNepali.value
                                  ? controller
                                      .importantLinklist[index].title!.np
                                      .toString()
                                  : controller
                                      .importantLinklist[index].title!.en
                                      .toString(),
                              subtitle: controller
                                  .importantLinklist[index].link!
                                  .toString(),
                              ontap: () {
                                launchUrl(Uri.parse(controller
                                    .importantLinklist[index].link
                                    .toString()));
                              },
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
