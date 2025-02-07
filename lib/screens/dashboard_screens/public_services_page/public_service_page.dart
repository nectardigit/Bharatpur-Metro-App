import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/transportation_page.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';

class PublicServicePage extends StatefulWidget {
  const PublicServicePage({Key? key}) : super(key: key);

  @override
  State<PublicServicePage> createState() => _PublicServicePageState();
}

class _PublicServicePageState extends State<PublicServicePage> {
  var controller = Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.getServiceCategory();
  }

  @override
  Widget build(BuildContext context) {
    controller.getServiceCategory();
    log(controller.serviceCategory.length.toString());
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          buildHeading(
            controller.isNepali.value ? "सेवा वर्गहरू" : "Services Category",
          ),
          const SizedBox(height: 10),
          Obx(() => controller.loadingServiceCategory.value == true
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const Skelton(height: 50, width: double.infinity);
                    },
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.serviceCategory.length,
                  itemBuilder: (context, index) {
                    var data = controller.serviceCategory[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        child: CustomTile(
                          ontap: () {
                            Get.to(() => PublicServices(
                                category: controller.isNepali.value
                                    ? data.title!.np.toString()
                                    : data.title!.en.toString()));
                          },
                          title: controller.isNepali.value
                              ? data.title!.np.toString()
                              : data.title!.en.toString(),
                          trailing: const Icon(Icons.arrow_right_alt),
                        ),
                      ),
                    );
                  },
                ))
        ],
      ),
    );
  }
}
