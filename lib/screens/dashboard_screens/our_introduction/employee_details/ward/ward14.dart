import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/teams_listview.dart';

class Ward14OfficersScreen extends StatelessWidget {
  Ward14OfficersScreen({
    Key? key,
  });
  final controller = Get.put(AppController());
  final ourInformationController = Get.put(OurInformationController());

  @override
  Widget build(BuildContext context) {
    List<TeamData> ward14OfficersScreen = controller.teamlist
        .where((e) => e.office!.en == 'Ward 14 Ward Office')
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? '१४ वार्ड कार्यालयहरु' : '14 Ward Offices',
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 10),
          ward14OfficersScreen.isEmpty
              ? buildNodata()
              : TeamListView().teamMember(datas: ward14OfficersScreen)
        ]),
      ),
    );
  }
}
