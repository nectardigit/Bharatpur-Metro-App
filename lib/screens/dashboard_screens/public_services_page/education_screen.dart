import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/public_service.dart';
import 'package:gandakimun/screens/dashboard_screens/public_services_page/widget/service_category_fileOpen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/nodata.dart';

class EducationScreen extends StatelessWidget {
  EducationScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    List<PublicSericeHeadingModel> educationService = controller.publicService
        .where((e) => e.serviceCategoryId! == 8)
        .toList();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar:
            buildAppbar(controller.isNepali.isTrue ? 'शिक्षा' : 'Education'),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            buildHeading(controller.isNepali.isTrue ? 'शिक्षा' : 'Education'),
            educationService.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: educationService.length,
                    itemBuilder: (context, index) {
                      var data = educationService[index];
                      return CustomTile(
                        ontap: () {
                          Get.to(PublicServiceFileOpen(
                            publicSericeHeadingModel: data,
                            text: controller.isNepali.isTrue
                                ? 'शिक्षा'
                                : 'Education',
                          ));
                        },
                        height: 70,
                        title: controller.isNepali.value
                            ? data.title!.np.toString()
                            : data.title!.en.toString(),
                        subtitle: data.createdAt,
                        trailing: const Icon(Icons.picture_as_pdf),
                      );
                    })
                : buildNodata(),
          ],
        ));
  }
}
