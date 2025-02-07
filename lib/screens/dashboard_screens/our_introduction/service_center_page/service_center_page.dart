import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/introductioncontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/service_center_page/office_group/filter_office_group.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/shimmer.dart';

class ServiceCenter extends GetView<AppController> {
  ServiceCenter({Key? key}) : super(key: key);

  @override
  final controller = Get.put(AppController());
  final introductionController = Get.put(IntroductionController());

  @override
  Widget build(BuildContext context) {
    introductionController.fetchOfficeType();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
          controller.isNepali.value
              ? ' प्रशासनिक सेवा'
              : 'Administrative Units',
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                buildHeading(
                  controller.isNepali.value
                      ? ' प्रशासनिक सेवा'
                      : 'Administrative Units',
                ),
                const SizedBox(height: 10),
                Obx(
                  () => introductionController.loadingOfficeType.isTrue
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
                          itemCount: introductionController.officeType.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = introductionController.officeType[index];
                            return CustomTile(
                              ontap: () {
                                switch (index) {
                                  case 0:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Municipal Executive Office',
                                    ));

                                    break;
                                  case 1:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Ward Office',
                                    ));

                                    break;
                                  case 2:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Hospital',
                                    ));

                                    break;
                                  case 3:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Primary Health Center',
                                    ));

                                    break;
                                  case 4:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Health Post',
                                    ));

                                    break;
                                  case 5:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Basic Health Center',
                                    ));

                                    break;
                                  case 6:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Urban Health Center',
                                    ));

                                    break;
                                  case 7:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Birthing Center  Gogane',
                                    ));

                                    break;
                                  case 8:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Citizen Health Center',
                                    ));

                                    break;
                                  case 9:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Agriculture Service Center',
                                    ));

                                    break;
                                  case 10:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Veterinary Service Center',
                                    ));

                                    break;
                                  case 11:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Tax Payer Service Center',
                                    ));

                                    break;
                                  case 12:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Health Organizations',
                                    ));

                                    break;
                                  case 13:
                                    Get.to(FilterServiceGroup(
                                      officeTypeHeadingModel: data,
                                      text: 'Service Centers',
                                    ));

                                    break;
                                  default:
                                }
                              },
                              title: controller.isNepali.value
                                  ? data.title!.np.toString()
                                  : data.title!.en.toString(),
                            );
                          }),
                ),
                // // controller.loadings.isFalse
                // //     ? SizedBox(
                // //         height: size.height * .8,
                // //         width: size.width * .98,
                // //         child: ListView.builder(
                // //           itemCount: list.length,
                // //           itemBuilder: (context, index) {
                // //             return Card(
                // //               margin: const EdgeInsets.symmetric(vertical: 5),
                // //               child: ExpansionTile(
                // //                 initiallyExpanded: false,
                // //                 title: Text(
                // //                     controller.isNepali.value
                // //                         ? '- ${list[index].title!.np}'
                // //                         : '- ${list[index].title!.en}',
                // //                     textAlign: TextAlign.left,
                // //                     overflow: TextOverflow.ellipsis,
                // //                     style: titleStyle),
                // //                 children: <Widget>[
                // //                   ListTile(
                // //                     contentPadding: const EdgeInsets.symmetric(
                // //                         horizontal: 10),
                // //                     leading: TextButton(
                // //                       onPressed: () {},
                // //                       child: Text(
                // //                         controller.isNepali.value
                // //                             ? '-> ${list[index].serviceGroup!.np}'
                // //                             : '-> ${list[index].serviceGroup!.en}',
                // //                         textAlign: TextAlign.left,
                // //                         style: const TextStyle(
                // //                             fontWeight: FontWeight.w700),
                // //                       ),
                // //                     ),
                // //                   )
                // //                 ],
                // //               ),
                // //             );
                //           },
                //         ),
                //       )
                //     : const Padding(
                //         padding: EdgeInsets.all(10.0),
                //         child: Skelton(height: 500, width: double.infinity),
                //       ),
              ],
            ),
          ),
        ));
  }
}
