import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';

import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/teams_listview.dart';

class Ward4OfficersScreen extends StatefulWidget {
  Ward4OfficersScreen({
    Key? key,
  });

  @override
  State<Ward4OfficersScreen> createState() => _Ward4OfficersScreenState();
}

class _Ward4OfficersScreenState extends State<Ward4OfficersScreen> {
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<TeamData> ward11OfficersScreen = controller.teamlist
        .where((e) => e.office!.en == 'ward 4 Ward Office')
        .toList();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? '४ वार्ड कार्यालयहरु' : '4 Ward Offices',
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
