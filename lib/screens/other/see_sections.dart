import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/not_uploaded.dart';

// ignore: must_be_immutable
class SeeSections extends StatelessWidget {
  SeeSections({Key? key}) : super(key: key);
  AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
        appBar: buildAppbar(
            controller.isNepali.value ? "विभागहरु हेर्नुहोस्" : "See Sections"),
        backgroundColor: AppColor.backgroundClr,
        body: SingleChildScrollView(
            child: Obx(() => controller.sectionlist.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ...List.generate(controller.sectionlist.length,
                            (index) {
                          var data = controller.sectionlist[index];
                          return data.status == 1
                              ? CustomTile(
                                  ontap: () {
                                    Get.to(() => const NotUploaded(
                                          title:
                                         
                                              "See Sections",
                                        ));
                                  },
                                  title: controller.isNepali.value
                                      ? data.title!.np.toString()
                                      : data.title!.en.toString(),
                                  subtitle: controller.isNepali.value
                                      ? data.description!.np.toString()
                                      : data.description!.en.toString())
                              : Container();
                        })
                      ],
                    ),
                  )
                : Center(
                    child: buildNodata(),
                  ))));
  
  
  }
}
