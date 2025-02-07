import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class Ambulance extends StatelessWidget {
  Ambulance({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar('एम्बुलेन्स्'),
        backgroundColor: AppColor.backgroundClr,
        body: SingleChildScrollView(
          child: Obx(() => controller.ambulancelist.isNotEmpty
              ? controller.loading.value
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          ...List.generate(controller.ambulancelist.length,
                              (index) {
                            var data = controller.ambulancelist[index];

                            return CustomTile(
                                title: "Driver Name: ${data.driverName!.en}",
                                subtitle:
                                    "Address: ${data.address!.en}\nVehical no.: ${data.vehicleNumber}\nPhone no.: ${data.phone}");
                          })
                        ],
                      ),
                    )
              : buildNodata()),
        ));
  }
}
