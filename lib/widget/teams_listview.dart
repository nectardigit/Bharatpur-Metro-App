import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/model/teams.dart';
import 'package:get/get.dart';

class TeamListView {
  final controller = Get.put(AppController());
  ListView teamMember({
    required List<TeamData> datas,
  }) {
    return ListView.builder(
        itemCount: datas.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          var data = datas[index];
          return SizedBox(
            height: 190,
            width: 100,
            child: Card(
              // color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 05,
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 0,
                    ),
                    data.profile != null
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 100,
                                  child: CachedNetworkImage(
                                    imageUrl: data.profile.toString(),
                                    placeholder: (context, url) => const Center(
                                        child: CupertinoActivityIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      height: 120,
                                      width: 100,
                                      color: Colors.grey,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(bottom: 0.0),
                                //   child: Container(
                                //     height: 20,
                                //     width: 100,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(
                                //           color: Colors.red,
                                //           width: 1,
                                //         ),
                                //         color: Colors.green),
                                //     child: Center(
                                //         child: Text(data.hrmId.toString())
                                //         ),
                                //   ),
                                // )
                              ],
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.isNepali.value
                                  ? data.name!.np.toString()
                                  : data.name!.en.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.3),
                            ),
                            data.designation!.en != null
                                ? Text(
                                    controller.isNepali.value
                                        ? data.designation!.np.toString()
                                        : data.designation!.en.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  )
                                : const SizedBox(),
                            data.teamclass!.en != null
                                ? Text(
                                    controller.isNepali.value
                                        ? data.teamclass!.np.toString()
                                        : data.teamclass!.en.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        height: 1.3),
                                  )
                                : SizedBox(),
                            data.phone != null
                                ? Text(
                                    data.phone.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        height: 1.3),
                                  )
                                : SizedBox(),
                            data.email != null
                                ? Text(
                                    data.email.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        height: 1.3),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          );
        });
  }

  ListView officerListView(List<ElectedOfficalsData> officerListView) {
    return ListView.builder(
        itemCount: officerListView.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          var data = officerListView[index];
          return SizedBox(
            height: 145,
            width: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                                  child: CachedNetworkImage(
                                    imageUrl: data.image.toString(),
                                    placeholder: (context, url) => const Center(
                                        child: CupertinoActivityIndicator()),
                                    errorWidget: (context, url, error) =>
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
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.isNepali.value
                                  ? data.name!.np.toString()
                                  : data.name!.en.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.3),
                            ),
                            data.executiveDesignation!.np != null
                                ? Text(
                                    controller.isNepali.value
                                        ? data.executiveDesignation!.np
                                            .toString()
                                        : data.executiveDesignation!.en
                                            .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        height: 1.3),
                                  )
                                : const SizedBox(),
                            Text(
                              data.phone.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  height: 1.3),
                            ),
                            Text(
                              data.email.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
