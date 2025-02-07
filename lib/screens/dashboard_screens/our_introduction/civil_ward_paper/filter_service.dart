import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/civil_ward_paper_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/civil_ward_paper/civil_ward_paper_details.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:get/get.dart';

class ServicesFilterScreen extends StatelessWidget {
  ServicesFilterScreen(
      {Key? key,
      required this.datum,
      required this.index,
      required this.text});
  CivilWardPaperModel datum;
  int index;
  String text;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return Scaffold(
      appBar:
          buildAppbar(datum.data!.entries.map((e) => e.key).toList()[index]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: datum.data!.values.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = datum.data!.values.toList()[index];
                  List<CivilWardPaperHeadingModel> filterdata = data
                      .where((e) =>
                          e.serviceOffice!.np == "गाउँपालिका कार्यालय")
                      .toList();

                  return ListView.builder(
                      itemCount: filterdata.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomTile(
                            ontap: () {
                              Get.to(CivilWardPaperDetailsPage(
                                list: filterdata[index],
                              ));
                            },
                            title: controller.isNepali.value
                                ? filterdata[index].serviceOffice!.np.toString()
                                : filterdata[index].serviceOffice!.en.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
