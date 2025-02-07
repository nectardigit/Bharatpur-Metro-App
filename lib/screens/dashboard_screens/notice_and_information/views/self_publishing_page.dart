import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/2078/79/81.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/2080/2079.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/2080/80.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';

class SelfPublishingPage extends StatelessWidget {
  SelfPublishingPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    var list = controller.fiscalYearList;
    controller.fetchFiscalYear();
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'स्वत:प्रकाशन' : 'Self Publishing'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            buildHeading(
                controller.isNepali.value ? 'स्वत:प्रकाशन' : 'Self Publishing'),
            Obx(
              () => controller.loadingFiscalYear.isTrue
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const Skelton(
                              height: 50, width: double.infinity);
                        },
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        var data = list[index];
                        return CustomTile(
                          ontap: () {
                            switch (index) {
                              case 0:
                                {
                                  Get.to(SelfPublishingHeadingScreen());
                                }

                                break;
                              case 1:
                                {
                                  Get.to(SelfPublishingHeading2Screen());
                                }
                                break;
                              case 2:
                                {
                                  Get.to(SelfPublishingHeading3Screen());
                                }
                                break;
                              default:
                            }
                          },
                          title: controller.isNepali.value
                              ? data.npTitle.toString()
                              : data.enTitle.toString(),
                        );
                      }),
            ),

            // SizedBox(
            //   height: size.height * .8,
            //   width: size.width * .98,
            //   child: ListView.builder(
            //     itemCount: list.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child: GestureDetector(
            //           onTap: () async {},
            //           child: CustomTile(
            //             ontap: () {
            //               Get.to(SelfPublishingDetailScreen(
            //                 selfPublishingHeadingModel: list[index],
            //               ));
            //             },
            //             height: 70,
            //             title: controller.isNepali.value
            //                 ? list[index].title!.np.toString()
            //                 : list[index].title!.en.toString(),
            //             trailing: const Icon(Icons.arrow_right_alt),
            //             subtitle: list[index].date == null
            //                 ? ''
            //                 : list[index].date.toString(),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
