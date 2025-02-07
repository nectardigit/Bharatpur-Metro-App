// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/teams_listview.dart';

class Ward8OfficerDetails extends StatelessWidget {
  Ward8OfficerDetails({
    Key? key,
  });

  final controller = Get.put(AppController());
  final ourInformationController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> ward11OfficersScreen = controller.electedOffical
        .where((e) => e.wardNumber!.en == 'Ward 8' && e.isWard == 1)
        .toList();

    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? '८ नं वडा कार्यालयहरु' : '8 Ward Offices',
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 10),
          ward11OfficersScreen.isEmpty
              ? buildNodata()
              : TeamListView().officerListView(ward11OfficersScreen)
        ]),
      ),
    );
  }
}
