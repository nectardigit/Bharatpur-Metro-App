import 'package:flutter/material.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/news.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/gazette/gazette_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/reports_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/self_publishing_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/budget_and_programs_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/laws_notice_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/notice_page.dart';

import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/plans/plans_page.dart';
import 'package:gandakimun/widget/dashboard_card.dart';

class NoticeDashboardWidget extends StatelessWidget {
  const NoticeDashboardWidget({
    Key? key,
    required this.title,
    required this.img,
    required this.controller,
    required this.nptitle,
  }) : super(key: key);

  final List<String> title;
  final List<String> img;
  final AppController controller;
  final List<String> nptitle;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
            title: controller.isNepali.value ? nptitle[indexx] : title[indexx],
            ontap: () {
              switch (indexx) {
                case 0:
                  {
                    Get.to(() => NoticePage());
                  }
                  break;
                case 1:
                  {
                    Get.to(() => PlansPage());
                  }
                  break;
                case 2:
                  {
                    Get.to(() => BudgetAndPrograms());
                  }
                  break;
                case 3:
                  {
                    Get.to(() => Laws());
                  }
                  break;
                case 4:
                  {
                    // Get.to(() => WebviewWidget(
                    //     title: controller.isNepali.value
                    //         ? 'राजपत्रहरु '
                    //         : "Gazette",
                    //     url: 'https://suryodayamun.gov.np/ne/rajpatra'));
                    Get.to(() => GezettePage());
                  }
                  break;
                case 5:
                  {
                    Get.to(() => ReportsPage());
                  }
                  break;
                case 6:
                  {
                    Get.to(() => SelfPublishingPage());
                  }
                  break; case 6:
                {
                  Get.to(() => NewsPage());
                }
                break;

                default:
              }
            });
      },
    );
  }
}
