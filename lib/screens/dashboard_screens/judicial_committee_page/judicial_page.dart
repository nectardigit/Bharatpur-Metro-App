import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/screens/dashboard_screens/judicial_committee_page/conciliation_centers.dart';
import 'package:gandakimun/screens/dashboard_screens/judicial_committee_page/list_of_conciliators.dart';
import 'package:gandakimun/screens/dashboard_screens/judicial_committee_page/officers.dart';
import 'package:gandakimun/screens/dashboard_screens/judicial_committee_page/state_of_conciliation.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';

import '../../../controllers/appcontroller.dart';
import '../our_introduction/employee_details/employee_details.dart';

class JudicialPage extends StatelessWidget {
  JudicialPage({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var nplist = [
      'पदअधिकारीहरू',
      // 'कर्मचारीहरु',
      'मेलमिलाप केन्द्रहरु',
      'मेलमिलापकर्ताहरुको सुची',
      'मेलमिलापको अवस्था',
    ];
    var list = [
      'Officers',
      // 'Employees',
      'Conciliation Centres',
      'List of Conciliators',
      'State of Conciliation',
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? "न्ययिक समिति" : "Judicial Committee",
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(
            controller.isNepali.value ? "न्ययिक समिति" : "Judicial Committee",
          ),
          SizedBox(
            height: size.height * .8,
            width: size.width * .98,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          {
                            Get.to(() => OfficersPage(
                                  title: controller.isNepali.value
                                      ? 'पदअधिकारीहरू'
                                      : 'Officers',
                                ));
                          }
                          break;
                        // case 1:
                        //   {
                        //     Get.to(() => EmployeeDetails());
                        //   }
                        //   break;
                        case 1:
                          {
                            Get.to(() => const ConciliationCenters());
                          }
                          break;
                        case 2:
                          {
                            Get.to(() => const ListOfConcilators());
                          }
                          break;
                        case 3:
                          {
                            Get.to(() => const StateOfConciliation());
                          }
                          break;
                        default:
                      }
                    },
                    child: CustomTile(
                      title: controller.isNepali.value
                          ? nplist[index]
                          : list[index],
                      trailing: const Icon(Icons.arrow_right_alt),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
