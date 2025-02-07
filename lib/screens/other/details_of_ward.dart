import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/wards.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/nodata.dart';

import '../../constants.dart';
import '../../widget/box_shadow.dart';

class DetailsOfWard extends StatelessWidget {
  DetailsOfWard({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  final ourInformationController = Get.put(OurInformationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'वडा कार्यालयहरुको विवरण'
          : 'Details of ward offices'),
      body: SingleChildScrollView(
        child: Obx(() => ourInformationController.wardlist.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ...List.generate(ourInformationController.wardlist.length,
                        (index) {
                      var data = ourInformationController.wardlist[index];
                   return  InkWell(
                              onTap: () {
                                Get.to(() => WardDetails(
                                      data: data,
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
                                        controller.isNepali.value
                                            ? data.title!.np.toString()
                                            : data.title!.en.toString(),
                                        style: subtitleStyle,
                                      ))),
                            )
                         ;
                    })
                  ],
                ),
              )
            : buildNodata()),
      ),
    );
  }
}

class WardDetails extends StatelessWidget {
  WardDetails({Key? key, this.data}) : super(key: key);
  final WardHeadingModel? data;
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? data!.title!.np : data!.title!.en),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeading(
                        controller.isNepali.value ? 'विवरण' : "Details"),
                    // Text(
                    //   controller.isNepali.value ? 'विवरण' : "Details",
                    //   style: ,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),

                    // HtmlWidget(
                    //   controller.isNepali.value
                    //       ? data!.description!.np.toString()
                    //       : data!.description!.en.toString(),
                    // ),
                    Text(
                      controller.isNepali.value
                          ? data!.details!.np.toString()
                          : data!.details!.en.toString(),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              )),
          Expanded(flex: 1, child: Container())
        ],
      ),
    );
  }
}
