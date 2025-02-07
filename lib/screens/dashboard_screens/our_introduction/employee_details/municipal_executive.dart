import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/widget/teams_listview.dart';
import 'package:get/get.dart';

class ExecutiveScreen extends StatefulWidget {
  String text;
  ExecutiveScreen({Key? key, required this.text});

  @override
  State<ExecutiveScreen> createState() => _ExecutiveScreenState();
}

class _ExecutiveScreenState extends State<ExecutiveScreen> {
  final controller = Get.put(AppController());

  final ourInformationController = Get.put(OurInformationController());

  @override
  Widget build(BuildContext context) {
    // List<TeamData> branchOfficer = controller.teamlist
    //     .where((e) => e.branch!.en == 'Financial Administration Section')
    //     .toList();
    List<TeamData> chiefAdmintrationOfficerNew = controller.teamlist
        .where((e) => e.office!.np == widget.text && e.condition == 0)
        .toList();
    List<TeamData> chiefAdmintrationOfficerEngNew = controller.teamlist
        .where((e) => e.office!.en == widget.text && e.condition == 0)
        .toList();
    List<TeamData> chiefAdmintrationOfficerOld = controller.teamlist
        .where((e) => e.office!.np == widget.text && e.condition == 1)
        .toList();
    List<TeamData> chiefAdmintrationOfficerEngOld = controller.teamlist
        .where((e) => e.office!.en == widget.text && e.condition == 1)
        .toList();
    // List<TeamData> internalAuditOfficer = controller.teamlist
    //     .where((e) => e.branch!.en == 'Internal Audit Section')
    //     .toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: AppBar(
          title: Text(controller.isNepali.value
              ? 'कर्मचारी विवरण'
              : 'Employee Details'),
          bottom: TabBar(
            indicatorColor: AppColor.red,
            tabs: [
              Tab(text: controller.isNepali.value ? "कर्मचारी" : "Employee"),
              Tab(
                  text: controller.isNepali.value
                      ? "पूर्व कर्मचारी"
                      : "Former Employee")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // buildHeading(controller.isNepali.value
                    //     ? 'नगर कार्यपालिकाको कार्यालय'
                    //     : 'Office of Municipal Executive'),
                    const SizedBox(height: 10),
                    TeamListView().teamMember(
                        datas: controller.isNepali.value
                            ? chiefAdmintrationOfficerNew
                            : chiefAdmintrationOfficerEngNew),
                  ]),
            ),
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // buildHeading(controller.isNepali.value
                    //     ? 'नगर कार्यपालिकाको कार्यालय'
                    //     : 'Office of Municipal Executive'),
                    const SizedBox(height: 10),
                    TeamListView().teamMember(
                        datas: controller.isNepali.value
                            ? chiefAdmintrationOfficerOld
                            : chiefAdmintrationOfficerEngOld),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
