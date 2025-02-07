import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/teams_listview.dart';

class  Ward9OfficersScreen extends StatelessWidget {
  Ward9OfficersScreen({
    Key? key,
  });
  final controller = Get.put(AppController());
  final ourInformationController = Get.put(OurInformationController());

  @override
  Widget build(BuildContext context) {
    List<TeamData> ward11OfficersScreen = controller.teamlist
        .where((e) => e.office!.en == 'Ward 9 Ward Office')
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? '९ वार्ड कार्यालयहरु' : '9 Ward Offices',
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 10),
          ward11OfficersScreen.isEmpty
              ? buildNodata()
              : TeamListView().teamMember(datas: ward11OfficersScreen)
        ]),
      ),
    );
  }
}
