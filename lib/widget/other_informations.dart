// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/general_purchase.dart';
import 'package:gandakimun/model/projectplan.dart';
import 'package:gandakimun/screens/budget_screen.dart';
import 'package:gandakimun/screens/general_purchase.dart';
import 'package:gandakimun/screens/tax_screen.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants.dart';

class OtherInformations extends StatelessWidget {
  OtherInformations({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  List<GeneralServiceModel> datas = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColor.primaryClr,
              ),
              child: Obx(
                () => TabBar(
                    indicatorColor: AppColor.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    labelStyle: subtitleStyle.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    unselectedLabelStyle: subtitleStyle.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text(
                          controller.isNepali.value
                              ? 'सार्वजनिक खरीद'
                              : "Public procurement",
                        ),
                      ),
                      Tab(
                        child: Text(
                          controller.isNepali.value
                              ? 'बजेट तथा कार्यक्रम'
                              : "Budget and programs",
                        ),
                      ),
                      // Tab(
                      //   child: Text(
                      //     controller.isNepali.value
                      //         ? 'योजना तथा परियोजना'
                      //         : "Plan and project",
                      //   ),
                      // ),
                      // Tab(
                      //   child: Text(
                      //     controller.isNepali.value
                      //         ? 'कर तथा दस्तुर'
                      //         : "Taxes and fees",
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ]),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBarView(children: [
                buildSawajanikKharidTab(),
                buildBudgetTab(),
                // buildProjectplanTab(),
                // buildTaxTab()
              ]),
            ),
          ],
        ));
  }

  buildSawajanikKharidTab() {
    controller.fetchgeneralPurchaseList();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 05,
          ),
          Obx(
            () => controller.loadingGeneralPurchaseList.isTrue
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const Skelton(
                            height: 50, width: double.infinity);
                      },
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.generalPurchaseList.length,
                    itemBuilder: (context, index) {
                      var data = controller.generalPurchaseList[index];
                      return CustomTile(
                        height: 70,
                        ontap: () {
                          Get.to(() => GeneralPurchaseDetail(
                                data: data,
                              ));
                        },
                        title: controller.isNepali.value
                            ? data.title!.np.toString()
                            : data.title!.en.toString(),
                      );
                    }),
          ),
        ],
      ),
    );
  }

  buildBudgetTab() {
    return Obx(() => controller.budgetlist.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.budgetlist.length,
                    itemBuilder: (context, index) {
                      var data = controller.budgetlist[index];
                      return CustomTile(
                        ontap: () {
                          Get.to(() => BudgetScreen(
                                data: data,
                              ));
                        },
                        title: controller.isNepali.value
                            ? data.title!.np.toString()
                            : data.title!.en.toString(),
                      );
                    }),
              ],
            ),
          )
        : buildNodata());
  }

  buildProjectplanTab() {
    return Obx(() => controller.projectplanlist.isNotEmpty
        ? ListView.separated(
            itemCount: controller.projectplanlist.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemBuilder: (context, index) => CustomTile(
              ontap: () {
                Get.to(() => PlanProjectDetails(
                      data: controller.projectplanlist[index],
                    ));
              },
              title: controller.isNepali.value
                  ? controller.projectplanlist[index].title!.np.toString()
                  : controller.projectplanlist[index].title!.en.toString(),
            ),
          )
        : buildNodata());
  }

  buildTaxTab() {
    return Obx(
      () => controller.taxlist.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: controller.taxlist.length,
              itemBuilder: (context, index) {
                var data = controller.taxlist[index];
                return CustomTile(
                  ontap: () {
                    Get.to(() => TaxScreen(
                          data: data,
                        ));
                  },
                  title: controller.isNepali.value
                      ? data.title!.np.toString()
                      : data.title!.en.toString(),
                );
              },
            )
          : buildNodata(),
    );
  }
}

class PlanProjectDetails extends StatelessWidget {
  PlanProjectDetails({Key? key, this.data}) : super(key: key);
  final controller = Get.put(AppController());

  final ProjectplanData? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? 'योजना तथा परियोजना' : "Plan and project",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.isNepali.value
                    ? data!.title!.np.toString()
                    : data!.title!.en.toString(),
                style: titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data!.date.toString(),
                style: subtitleStyle,
              ),
              const Divider(
                thickness: 3,
              ),
              Text(
                controller.isNepali.value
                    ? data!.description!.np.toString()
                    : data!.description!.en.toString(),
                style: subtitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
