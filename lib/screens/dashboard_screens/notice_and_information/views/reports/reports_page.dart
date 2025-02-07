import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/annual_report_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/audit_report_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/financial_statement_page.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/monitoring_report_page%20copy.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/reports/other_statements_page.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/dashboard_card.dart';
import 'package:gandakimun/widget/heading.dart';

class ReportsPage extends StatelessWidget {
  ReportsPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var title = [
      'Financial Statements',
      'Annual Reports',
      'Audit reports',
      'Monitoring Reports',
      'Other Reports',
    ];
    var npTitle = [
      'बित्तिय प्रतिबेदनहरु',
      'वार्षिक प्रतिबेदनहरु',
      'लेखापरीक्षण प्रतिबेदनहरु',
      'अनुगमन प्रतिबेदनहरु',
      'अन्य प्रतिबेदनहरु',
    ];
    final List<String> img = [
      AppIcons.checklist,
      AppIcons.checklist,
      AppIcons.checklist,
      AppIcons.checklist,
      AppIcons.checklist,
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar:
          buildAppbar(controller.isNepali.value ? 'प्रतिबेदनहरु' : 'Reports'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value ? 'प्रतिबेदनहरु' : 'Reports'),
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
                          Get.to(() => FinancialStatementPage());
                        }
                        break;
                      case 1:
                        {
                          Get.to(() => AnnualReportPage());
                        }
                        break;
                      case 2:
                        {
                          Get.to(() => AuditReportPage());
                        }
                        break;
                      case 3:
                        {
                          Get.to(() => MonitoringReportPage());
                        }
                        break;
                      case 4:
                        {
                          Get.to(() => OtherStatementPage());
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
