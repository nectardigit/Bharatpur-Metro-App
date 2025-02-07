import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/public_service.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';

import '../../public_services_page/widget/service_category_fileOpen.dart';

class HealthServices extends StatelessWidget {
  HealthServices({Key? key}) : super(key: key);

  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<PublicSericeHeadingModel> healthService = controller.publicService
        .where((e) => e.serviceCategoryId! == 2)
        .toList();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
          controller.isNepali.value ? 'स्वास्थ्य सेवाहरू' : 'Health services',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(
                controller.isNepali.value
                    ? 'स्वास्थ्य सेवाहरू'
                    : 'Health services',
              ),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: healthService.length,
                  itemBuilder: (context, index) {
                    var data = healthService[index];
                    return CustomTile(
                      ontap: () {
                        Get.to(PublicServiceFileOpen(
                          publicSericeHeadingModel: data,
                          text: controller.isNepali.value
                              ? 'स्वास्थ्य सेवाहरू'
                              : 'Health services',
                        ));
                      },
                      height: 70,
                      title: controller.isNepali.value
                          ? data.title!.np.toString()
                          : data.title!.np.toString(),
                      subtitle: data.createdAt,
                      trailing: const Icon(Icons.picture_as_pdf),
                    );
                  }),
              // SizedBox(
              //   height: size.height * .82,
              //   width: size.width * .98,
              //   child: ListView.builder(
              //     itemCount: list.length,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(0),
              //         child: ExpansionTile(
              //           initiallyExpanded: true,
              //           title: Text(
              //               controller.isNepali.value
              //                   ? '-${list[index].title!.np}'
              //                   : '-${list[index].title!.en}',
              //               textAlign: TextAlign.left,
              //               overflow: TextOverflow.ellipsis,
              //               style: titleStyle),
              //           children: <Widget>[
              //             ListTile(
              //               title: TextButton(
              //                 onPressed: () {
              //                   Get.to(HealthServicesDetailsPage(
              //                       list: list[index]));
              //                 },
              //                 child: Text(
              //                   controller.isNepali.value
              //                       ? '${list[index].heading!.np}'
              //                       : '${list[index].heading!.en}',
              //                   style: const TextStyle(
              //                       fontWeight: FontWeight.w700),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ));
  }
}
