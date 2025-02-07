import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/plans/annual_plan_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/plans/periodic_plans_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/plans/sectoral_plans_page.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/dashboard_card.dart';
import 'package:gandakimun/widget/heading.dart';

class PlansPage extends StatelessWidget {
  PlansPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    var title = [
      'Periodic plan',
      'Sectoral Plans',
      'Annual Plans',
    ];
    var npTitle = [
      'आवधिक योजना',
      'क्षेत्रगत योजनाहरु',
      'वार्षिक योजनाहरु',
    ];
    final List<String> img = [
      AppIcons.checklist,
      AppIcons.checklist,
      AppIcons.checklist,
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'योजनाहरु' : 'Plans'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value ? 'योजनाहरु' : 'Plans'),
          GridView.builder(
            padding: const EdgeInsets.all(20),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: title.length,
            itemBuilder: (context, indexx) {
              return DashboardCard(
                  img: img[indexx],
                  title: controller.isNepali.value
                      ? npTitle[indexx]
                      : title[indexx],
                  ontap: () {
                    switch (indexx) {
                      case 0:
                        {
                          Get.to(() => PeriodicPlansPage());
                        }
                        break;
                      case 1:
                        {
                          Get.to(() => SectoralPlans());
                        }
                        break;
                      case 2:
                        {
                          Get.to(() => AnnualPlansPage());
                        }
                        break;
                      default:
                    }
                  });
            },
          )
        ],
      ),
    );
  }
}
