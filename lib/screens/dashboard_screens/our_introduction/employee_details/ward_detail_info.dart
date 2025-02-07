import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';

class WardDetailTeamScreen extends StatelessWidget {
   WardDetailTeamScreen({Key? key});
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
          controller.isNepali.value ? 'वार्ड कार्यालयहरु' : 'Ward Offices',
        ),
    );
  }
}
