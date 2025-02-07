import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/municipality.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/box_shadow.dart';
import 'package:gandakimun/widget/nodata.dart';

class MunicipalityProfile extends StatelessWidget {
  MunicipalityProfile({Key? key}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value
          ? 'नगरपालिका प्रोफाइल'
          : 'Municipality Profile'),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Obx(() => controller.municipalitylist.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ...List.generate(
                        controller.municipalitylist.length,
                        (index) =>
                            controller.municipalitylist[index].status == 1
                                ? InkWell(
                                    onTap: () {
                                      Get.to(() => NagarpalikaDetail(
                                            data: controller
                                                .municipalitylist[index],
                                          ));
                                    },
                                    child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [buildBoxShadow()]),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              controller.municipalitylist[index]
                                                  .title!.np
                                                  .toString(),
                                              style: subtitleStyle,
                                            ))),
                                  )
                                : Container())
                  ],
                ),
              )
            : Center(
                child: buildNodata(),
              )),
      ),
    );
  }
}

class NagarpalikaDetail extends StatelessWidget {
  NagarpalikaDetail({Key? key, this.data}) : super(key: key);
  final controller = Get.put(AppController());
  final MunicipalityData? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('नगरपालिका बिबारान'),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                1, (index) => buildExpansionTile('जनसंख्यिक तथ्यङ्क'))
          ],
        ),
      ),
    );
  }

  buildExpansionTile(title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: ThemeData(
            expansionTileTheme: const ExpansionTileThemeData(
                backgroundColor: AppColor.primaryClr,
                textColor: Colors.white,
                iconColor: Colors.white)),
        child: ExpansionTile(
          title: Text(
            title,
            style: subtitleStyle.copyWith(color: Colors.white),
          ),
          collapsedTextColor: Colors.white,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: AppColor.primaryClr),
                  boxShadow: [buildBoxShadow()]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ...List.generate(
                  //   5,
                  //   (index) => ListTile(
                  //     title: Text('no data'),
                  //   ),
                  // )
                  HtmlWidget(controller.isNepali.value
                      ? data!.details!.np.toString()
                      : data!.details!.en.toString())
                  // Text(controller.isNepali.value
                  //     ? data!.details!.np.toString()
                  //     : data!.details!.en.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
