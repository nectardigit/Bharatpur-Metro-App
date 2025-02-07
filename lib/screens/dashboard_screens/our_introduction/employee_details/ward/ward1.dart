import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/teams_listview.dart';
import 'package:get/get.dart';

class Ward1OfficersScreen extends StatefulWidget {
  const Ward1OfficersScreen({
    Key? key,
    this.isShow = false,
  });
  final bool isShow;

  @override
  State<Ward1OfficersScreen> createState() => _Ward1OfficersScreenState();
}

class _Ward1OfficersScreenState extends State<Ward1OfficersScreen> {
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    List<TeamData> ward11OfficersScreen = controller.teamlist
        .where((e) => e.office!.en == 'Ward 1 Ward Office')
        .toList();

    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? '१ नं वडा कार्यालयहरु' : '1 Ward Offices',
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
