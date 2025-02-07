import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/law_file_open.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/plans/open_periodic_file.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';

class SectoralPlans extends StatefulWidget {
  const SectoralPlans({Key? key}) : super(key: key);

  @override
  State<SectoralPlans> createState() => _SectoralPlansState();
}

class _SectoralPlansState extends State<SectoralPlans> {

  var controller = Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getSectoralPlan();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.getSectoralPlan();
    var list = controller.sectoralPlanList;
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'क्षेत्रगत योजनाहरु' : 'Sectoral Plans'),
      body: Obx(()=> Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(controller.isNepali.value
              ? 'क्षेत्रगत योजनाहरु'
              : 'Sectoral plans'),
          controller.loadingPlans.value==true?LinearProgressIndicator():SizedBox(
            height: size.height * .8,
            width: size.width * .98,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(PlanDetailScreen(
                        planCategoryHeadingModel: list[index],
                      ));
                      // var id = list[index].id;
                      // var intexList =
                      //     list.where((element) => element.id == id).toList();
                      // Get.to(() => PlanInsidePage(list: intexList));
                    },
                    child: CustomTile(
                      height: 70,
                      title: controller.isNepali.value
                          ? list[index].title!.np.toString()
                          : list[index].title!.en.toString(),
                      // subtitle: list[index].date.toString().split(" ")[0],
                      // trailing: const Icon(Icons.arrow_right_alt),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

