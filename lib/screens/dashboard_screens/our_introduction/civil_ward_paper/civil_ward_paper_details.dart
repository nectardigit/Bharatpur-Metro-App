import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/civil_ward_paper_model.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CivilWardPaperDetailsPage extends StatelessWidget {
  final CivilWardPaperHeadingModel list;

  CivilWardPaperDetailsPage({
    Key? key,
    required this.list,
  }) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value
            ? 'नागनिरक वडापत्रको विवरण'
            : 'Civil Ward Paper Details ',
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(
                controller.isNepali.value
                    ? 'नागरिक वडापत्र  >>${list.services!.np}'
                    : 'Civil Ward Paper >> ${list.services!.en}',
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'सेवाको नाम : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Expanded(
                          child: Text(
                            controller.isNepali.value
                                ? list.services!.np.toString()
                                : list.services!.np.toString(),
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   'आवश्यक  कागजातहरु :',
                    //   style: titleStyle.copyWith(fontSize: 15),
                    // ),
                    Html(
                      data: controller.isNepali.value
                          ? list.importantPaper!.np.toString()
                          : list.importantPaper!.en.toString(),
                    ),
                    Text(
                      'प्रक्रिया:',
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    Html(
                      data: controller.isNepali.value
                          ? list.process!.np.toString()
                          : list.process!.en.toString(),
                    ),
                    Text(
                      'लिङ्क:',
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(list.link.toString());
                      },
                      child: Text(
                        list.link.toString(),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      'लाग्र्नुे समय :',
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      controller.isNepali.value
                          ? list.toTakeTime!.np.toString()
                          : list.toTakeTime!.en.toString(),
                    ),
                    Text(
                      'सेवा प्रवाह गर्नु कार्यालय :',
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      controller.isNepali.value
                          ? list.serviceOffice!.np.toString()
                          : list.serviceOffice!.en.toString(),
                    ),
                    Text(
                      'तजम्मेवार अधिकारी:',
                      style: titleStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      controller.isNepali.value
                          ? list.responsibleOfficer!.np.toString()
                          : list.responsibleOfficer!.en.toString(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
