import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/wards.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';

class WardDetailsPage extends StatelessWidget {
  final WardHeadingModel list;
  WardDetailsPage({Key? key, required this.list}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? 'वडाको विवरण' : 'Ward Office Details',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            buildHeading(
              controller.isNepali.value ? 'वडाको विवरण' : 'Ward Office Details',
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    controller.isNepali.value
                        ? list.details!.np.toString()
                        : list.details!.en.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
