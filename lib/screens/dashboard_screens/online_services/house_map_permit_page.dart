import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/no_data_dialog.dart';

class HouseMapPermitPage extends StatelessWidget {
  HouseMapPermitPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = [];
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'घर नक्सा इजाजत' : 'House Map Permit'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value
              ? 'घर नक्सा इजाजत'
              : 'House Map Permit'),
          list.isEmpty
              ? SizedBox(
                  height: size.height * .8,
                  child: const NoDataErrorBox(),
                )
              : SizedBox(
                  height: size.height * .8,
                  width: size.width * .4,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          onPressed: () {
                            // Get.to(WardDetailsPage(
                            //   list: list[index],
                            // ));
                          },
                          child: Text(controller.isNepali.value
                              ? '${list[index]}'
                              : '${list[index]}'),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
