import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/shimmer.dart';

import '../../../controllers/appcontroller.dart';
import '../../../widget/box_shadow.dart';

class OfficersPage extends StatelessWidget {
  OfficersPage({Key? key, this.title}) : super(key: key);

  final String? title;

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    controller.fetchElectedOffical();
    List<ElectedOfficalsData> judicialCommitteMember =
        controller.electedOffical.where((e) => e.isJudicial == '1').toList();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(title),
        body: SingleChildScrollView(
            child: Obx(
          () => controller.electedLoading.isTrue
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const Skelton(height: 50, width: double.infinity);
                    },
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: judicialCommitteMember.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = judicialCommitteMember[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [buildBoxShadow()]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CachedNetworkImage(
                                imageUrl: data.image.toString(),
                                placeholder: (context, url) => const Center(
                                    child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator())),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.isNepali.value
                                      ? data.name!.np.toString()
                                      : data.name!.en.toString(),
                                  style: titleStyle.copyWith(
                                      color: AppColor.primaryClr,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    controller.isNepali.value
                                        ? data.councilDesignation!.np.toString()
                                        : data.councilDesignation!.en
                                            .toString(),
                                    style: subtitleStyle),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    controller.isNepali.value
                                        ? data.phone!.toString()
                                        : data.phone!.toString(),
                                    style: subtitleStyle),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        )));
  }
}
