import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/law.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/law_file_open.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';

class LawLocalLevel extends StatelessWidget {
  LawLocalLevel({Key? key});
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<LawData> lawLocalFilter =
        controller.lawlist.where((e) => e.lawLevel == '2').toList();
    // var list = controller.lawtypeList;
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? ' स्थानीय कानुन' : ' Local Laws'),
      body: SingleChildScrollView(
          child: Column(children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: lawLocalFilter.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemBuilder: (context, index) {
              var e = lawLocalFilter[index];
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
