import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';

// ignore: unused_import
import 'package:gandakimun/widget/teams_listview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExecutiveCommitteMember extends StatefulWidget {
  ExecutiveCommitteMember({
    Key? key,
  });

  @override
  State<ExecutiveCommitteMember> createState() =>
      _ExecutiveCommitteMemberState();
}

class _ExecutiveCommitteMemberState extends State<ExecutiveCommitteMember> {
  final controller = Get.put(AppController());

  final ourInformationController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> executiveCommitteMemberOld = controller
        .electedOffical
        .where((e) => e.isExecutive == 1 && e.condition == 1)
        .toList();
    List<ElectedOfficalsData> executiveCommitteMemberNew = controller
        .electedOffical
        .where((e) => e.isExecutive == 1 && e.condition == 0)
        .toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: AppBar(
          title: Text(
            controller.isNepali.value ? 'कार्यपालिका' : 'Executive Committee',
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
                    ListView.builder(
                        itemCount: executiveCommitteMemberNew.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) {
                          var data = executiveCommitteMemberNew.reversed
                              .toList()[index];
                          return data.executiveDesignation!.np != null
                              ? SizedBox(
                                  height: 145,
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
                                                          imageUrl: data.image
                                                              .toString(),
                                                          placeholder: (context,
                                                                  url) =>
                                                              const Center(
                                                                  child:
                                                                      CupertinoActivityIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Container(
                                                            color: Colors.grey,
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 40),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.isNepali.value
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
                                                  data.wardDesignation!.np !=
                                                              null ||
                                                          data.wardDesignation!
                                                                  .en !=
                                                              null
                                                      ? Text(
                                                          controller.isNepali
                                                                  .value
                                                              ? data
                                                                  .wardDesignation!
                                                                  .np
                                                                  .toString()
                                                              : data
                                                                  .wardDesignation!
                                                                  .en
                                                                  .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                        )
                                                      : const SizedBox(),
                                                  data.executiveDesignation!
                                                              .en !=
                                                          null
                                                      ? Text(
                                                          controller.isNepali
                                                                  .value
                                                              ? data
                                                                  .executiveDesignation!
                                                                  .np
                                                                  .toString()
                                                              : data
                                                                  .executiveDesignation!
                                                                  .en
                                                                  .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                        )
                                                      : SizedBox(),
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
                                                          data.email.toString(),
                                                          style:
                                                              const TextStyle(
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
                        }),
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
                    ListView.builder(
                        itemCount: executiveCommitteMemberOld.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) {
                          var data = executiveCommitteMemberOld.reversed
                              .toList()[index];
                          return data.executiveDesignation!.np != null
                              ? SizedBox(
                                  height: 145,
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
                                                          imageUrl: data.image
                                                              .toString(),
                                                          placeholder: (context,
                                                                  url) =>
                                                              const Center(
                                                                  child:
                                                                      CupertinoActivityIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Container(
                                                            color: Colors.grey,
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 40),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.isNepali.value
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
                                                  data.wardDesignation!.np !=
                                                              null ||
                                                          data.wardDesignation!
                                                                  .en !=
                                                              null
                                                      ? Text(
                                                          controller.isNepali
                                                                  .value
                                                              ? data
                                                                  .wardDesignation!
                                                                  .np
                                                                  .toString()
                                                              : data
                                                                  .wardDesignation!
                                                                  .en
                                                                  .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                        )
                                                      : const SizedBox(),
                                                  data.executiveDesignation!
                                                              .en !=
                                                          null
                                                      ? Text(
                                                          controller.isNepali
                                                                  .value
                                                              ? data
                                                                  .executiveDesignation!
                                                                  .np
                                                                  .toString()
                                                              : data
                                                                  .executiveDesignation!
                                                                  .en
                                                                  .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 16,
                                                                  height: 1.3),
                                                        )
                                                      : SizedBox(),
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
                                                          data.email.toString(),
                                                          style:
                                                              const TextStyle(
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
                        }),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
