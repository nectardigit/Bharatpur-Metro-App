import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Ward1OfficerDetails extends StatelessWidget {
  String? ward;

  Ward1OfficerDetails({
    Key? key,
    this.ward,
  });

  final controller = Get.put(AppController());
  final ourInformationController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> wardOfficersScreenOld = controller.electedOffical
        .where((e) => e.wardNumber!.en == ward.toString() && e.condition == 1)
        .toList();
    List<ElectedOfficalsData> wardOfficersScreenNew = controller.electedOffical
        .where((e) => e.wardNumber!.en == ward.toString() && e.condition == 0)
        .toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: AppBar(
          title: Text(
            controller.isNepali.value ? ward.toString() : ward.toString(),
          ),
          bottom: TabBar(
            indicatorColor: AppColor.red,
            labelStyle: subtitleStyle.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: subtitleStyle.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.normal),
            tabs: [
              Tab(
                  text: controller.isNepali.value
                      ? "जनप्रतिनिधि"
                      : "Peoples representatives"),
              Tab(
                  text: controller.isNepali.value
                      ? "पुर्व जनप्रतिनिधि"
                      : "Former representatives")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 10),
                    wardOfficersScreenNew.isEmpty
                        ? buildNodata()
                        : ListView.builder(
                            itemCount: wardOfficersScreenNew.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (context, index) {
                              var data = wardOfficersScreenNew.reversed
                                  .toList()[index];
                              return data.wardNumber!.np != null
                                  ? SizedBox(
                                      height: 150,
                                      width: 120,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 05,
                                              ),
                                              Row(children: [
                                                const SizedBox(
                                                  width: 05,
                                                ),
                                                data.image != null
                                                    ? Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 120,
                                                            width: 100,
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: data
                                                                  .image
                                                                  .toString(),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const Center(
                                                                      child:
                                                                          CupertinoActivityIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Container(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 40),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                                .isNepali.value
                                                            ? data.name!.np
                                                                .toString()
                                                            : data.name!.en
                                                                .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            height: 1.3),
                                                      ),
                                                      data.judicialDesignation!
                                                                      .np !=
                                                                  null ||
                                                              data.judicialDesignation!
                                                                      .en !=
                                                                  null
                                                          ? Text(
                                                              controller
                                                                      .isNepali
                                                                      .value
                                                                  ? data
                                                                      .judicialDesignation!
                                                                      .np
                                                                      .toString()
                                                                  : data
                                                                      .judicialDesignation!
                                                                      .en
                                                                      .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                            )
                                                          : const SizedBox(),
                                                      data.wardDesignation!
                                                                      .np !=
                                                                  null ||
                                                              data.wardDesignation!
                                                                      .en !=
                                                                  null
                                                          ? Text(
                                                              controller
                                                                      .isNepali
                                                                      .value
                                                                  ? data
                                                                      .wardDesignation!
                                                                      .np
                                                                      .toString()
                                                                  : data
                                                                      .wardDesignation!
                                                                      .en
                                                                      .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                            )
                                                          : const SizedBox(),
                                                      Text(
                                                        data.phone.toString(),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            height: 1.3),
                                                      ),
                                                      data.email != null
                                                          ? Text(
                                                              data.email
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                            )
                                                          : SizedBox(),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox();
                            })
                  ]),
            ),
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 10),
                    wardOfficersScreenOld.isEmpty
                        ? buildNodata()
                        : ListView.builder(
                            itemCount: wardOfficersScreenOld.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (context, index) {
                              var data = wardOfficersScreenOld.reversed
                                  .toList()[index];
                              return data.wardNumber!.np != null
                                  ? SizedBox(
                                      height: 150,
                                      width: 120,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 05,
                                              ),
                                              Row(children: [
                                                const SizedBox(
                                                  width: 05,
                                                ),
                                                data.image != null
                                                    ? Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 120,
                                                            width: 100,
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: data
                                                                  .image
                                                                  .toString(),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const Center(
                                                                      child:
                                                                          CupertinoActivityIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Container(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 40),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                                .isNepali.value
                                                            ? data.name!.np
                                                                .toString()
                                                            : data.name!.en
                                                                .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            height: 1.3),
                                                      ),
                                                      data.judicialDesignation!
                                                                      .np !=
                                                                  null ||
                                                              data.judicialDesignation!
                                                                      .en !=
                                                                  null
                                                          ? Text(
                                                              controller
                                                                      .isNepali
                                                                      .value
                                                                  ? data
                                                                      .judicialDesignation!
                                                                      .np
                                                                      .toString()
                                                                  : data
                                                                      .judicialDesignation!
                                                                      .en
                                                                      .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                            )
                                                          : const SizedBox(),
                                                      data.wardDesignation!
                                                                      .np !=
                                                                  null ||
                                                              data.wardDesignation!
                                                                      .en !=
                                                                  null
                                                          ? Text(
                                                              controller
                                                                      .isNepali
                                                                      .value
                                                                  ? data
                                                                      .wardDesignation!
                                                                      .np
                                                                      .toString()
                                                                  : data
                                                                      .wardDesignation!
                                                                      .en
                                                                      .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                            )
                                                          : const SizedBox(),
                                                      Text(
                                                        data.phone.toString(),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            height: 1.3),
                                                      ),
                                                      data.email != null
                                                          ? Text(
                                                              data.email
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                            )
                                                          : SizedBox(),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox();
                            })
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
