import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/screens/other/taxDetailPage.dart';
import 'package:gandakimun/widget/appbar.dart';

import '../../controllers/appcontroller.dart';
import '../../widget/nodata.dart';

class StatementRegardingRevenue extends StatelessWidget {
  StatementRegardingRevenue({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar('कर तथा दस्तुर सम्बन्धी बिबरन'),
      body: SingleChildScrollView(
          child: Obx(() => controller.taxlist.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) => Container(
                          height: 10,
                        ),
                        itemCount: controller.taxlist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (() {
                              Get.to(() => TaxDetailPage(
                                    details: controller.taxlist[index],
                                  ));
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.grey,
                                        offset: Offset(1, 2))
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(controller.taxlist[index].title!.np
                                    .toString()),
                              ),
                            ),
                          );
                        },
                      ),
                      // ...List.generate(
                      //     controller.taxlist.length,
                      //     (index) => controller.taxlist[index].status == 1
                      //         ? InkWell(
                      //             onTap: () {
                      //               // Get.to(() => NagarpalikaDetail(
                      //               //       data: controller
                      //               //           .municipalitylist[index],
                      //               //     ));
                      //             },
                      //             child: Container(
                      //                 height: 50,
                      //                 width: double.infinity,
                      //                 margin: const EdgeInsets.all(5),
                      //                 padding: const EdgeInsets.all(10),
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     boxShadow: [buildBoxShadow()]),
                      //                 child: Align(
                      //                     alignment: Alignment.centerLeft,
                      //                     child: Text(
                      //                       controller.taxlist[index].title!.np
                      //                           .toString(),
                      //                       style: subtitleStyle,
                      //                     ))),
                      //           )
                      //         : Container())
                    ],
                  ),
                )
              : Center(
                  child: buildNodata(),
                ))
          // Column(
          //   children: [
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     ...List.generate(5, (index) => buildTile())
          //   ],
          // ),
          ),
    );
  }
}
