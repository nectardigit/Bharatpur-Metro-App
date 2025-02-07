import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/services.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/widget/nodata.dart';

class OurServices extends StatelessWidget {
  OurServices({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
        final ourInformationController = Get.put(OurInformationController());

  // var ontap = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Obx(() => ourInformationController.serviceslist.isNotEmpty
          ? Column(
              children: [
                ...List.generate(ourInformationController.serviceslist.length, (index) {
                  var data = ourInformationController.serviceslist[index];
                  return ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.add_circle_outline_sharp,
                      size: 30,
                      color: AppColor.primaryClr,
                    ),
                    title: Text(
                      controller.isNepali.value
                          ? data.title!.np.toString()
                          : data.title!.en.toString(),
                      style: subtitleStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 0.5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ],
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.isNepali.value
                                  ? data.description!.np.toString()
                                  : data.description!.en.toString(),
                              style: subtitleStyle.copyWith(
                                  fontSize: 15, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      )
                    ],
                  );

                  // buildServicesTile(
                  //     controller.isNepali.value
                  //         ? data.title!.np
                  //         : data.title!.en,
                  //     () {});
                }),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          : buildNodata()),
    );
  }

  buildServicesTile(txt, clicked) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      child: ListTile(
        onTap: clicked,
        leading: const Icon(
          Icons.add_circle_outline_sharp,
          size: 30,
          color: AppColor.primaryClr,
        ),
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(txt),
          ],
        ),
      ),
    );
  }
}

class ExtendService extends StatelessWidget {
  const ExtendService({Key? key, this.data}) : super(key: key);
  final ServicesData? data;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
