import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/law.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/law_file_open.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';

class DirectivesLawScreen extends StatelessWidget {
  DirectivesLawScreen({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<LawData> constitutionlawFilter =
        controller.lawlist.where((e) => e.lawType == '6').toList();
    // var list = controller.lawtypeList;
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? 'कार्यविधि कानुन' : ' Procedure Law'),
      body: SingleChildScrollView(
          child: Column(children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: constitutionlawFilter.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemBuilder: (context, index) {
              var e = constitutionlawFilter[index];
              return CustomTile(
                ontap: () {
                  Get.to(LawLocalDetailScreen(
                    lawData: e,
                  ));
                },
                height: 70,
                title: controller.isNepali.value
                    ? e.title!.np.toString()
                    : e.title!.en.toString(),
              );
            })
      ])),
    );
  }
}
