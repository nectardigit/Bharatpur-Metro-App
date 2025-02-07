import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/job_description_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/division_description.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/office_description.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/section_description.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/job_description_page/sub_section_description.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';

class JobDescriptionPage extends StatelessWidget {
  JobDescriptionPage({Key? key}) : super(key: key);

  final ourInformationController = Get.put(OurInformationController());
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    // var list = controller.jobDescriptionList;
    // List<JobDescriptionHeaderModel> jobdescriprion =
    //     list.where((e) => e.jdType == '1').toList();

    // List<JobDescriptionHeaderModel> divisionDescriprion =
    //     list.where((e) => e.jdType == '2').toList();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
            controller.isNepali.value ? 'कार्य विवरण' : 'Job description'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(controller.isNepali.value
                  ? 'कार्य विवरण'
                  : 'Job description'),
              const SizedBox(height: 10),
              CustomTile(
                  ontap: () {
                    Get.to(OfficeDescriptionScreen());
                  },
                  title: 'Office'),
              CustomTile(
                  ontap: () {
                    Get.to(DivisionDescriptionScreen());
                  },
                  title: 'Division'),
              CustomTile(
                  ontap: () {
                    Get.to(SectionDescriptionScreen());
                  },
                  title: 'Section'),
               CustomTile(
                ontap: () {
                    Get.to(SubSectionDescriptionScreen());
                  },
                title: 'Sub-Section'),
              // SizedBox(
              //   height: size.height * .82,
              //   width: size.width * .98,
              //   child: ListView.builder(
              //     itemCount: list.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         color: Colors.blue,
              //         child: ExpansionTile(
              //           initiallyExpanded: true,
              //           title: Text(
              //               controller.isNepali.value
              //                   ? list[index].title!.np.toString()
              //                   : list[index].title!.en.toString(),
              //               textAlign: TextAlign.left,
              //               overflow: TextOverflow.ellipsis,
              //               style: titleStyle.copyWith(color: Colors.white)),
              //           children: <Widget>[
              //             Container(
              //               color: Colors.white,
              //               child: ListTile(
              //                 title: Html(
              //                   data: controller.isNepali.value
              //                       ? list[index].details!.np.toString()
              //                       : list[index].details!.en.toString(),
              //                   onLinkTap: (url, context, attributes, element) {
              //                     Get.to(() => WebviewWidget(
              //                         url: url!,
              //                         title: controller.isNepali.value
              //                             ? 'कार्य विवरण'
              //                             : 'Jobs description'));
              //                   },
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
