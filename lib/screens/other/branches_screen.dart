
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import '../../constants.dart';
import '../../widget/appbar.dart';
import '../../widget/custom_tile.dart';
import '../../widget/nodata.dart';
import '../../widget/not_uploaded.dart';


class BranchesScreen extends StatelessWidget {
   BranchesScreen({Key? key}) : super(key: key);
  AppController controller = Get.put(AppController());


  @override
  Widget build(BuildContext context) {
    return
    
      Scaffold(
        appBar: buildAppbar(
            controller.isNepali.value ? "विवागहरु हेर्नुहोस्" : "See Sections"),
        backgroundColor: AppColor.backgroundClr,
        body: SingleChildScrollView(
            child: Obx(() => controller.branchList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ...List.generate(controller.branchList.length,
                            (index) {
                          var data = controller.branchList[index];
                          return data.status == 1
                              ? CustomTile(
                                  ontap: () {
                                    Get.to(() => const NotUploaded(
                                          title:
                                              // data.heading.toString() ??
                                              "See Sections",
                                        ));
                                  },
                                  title: controller.isNepali.value
                                      ? data.title!.np.toString()
                                      : data.title!.en.toString(),
                                  subtitle: controller.isNepali.value
                                      ? data.information!.np.toString()
                                      : data.information!.en.toString())
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