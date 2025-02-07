import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';

import 'package:gandakimun/widget/appbar.dart';
// ignore: unused_import
import 'package:gandakimun/widget/teams_listview.dart';

class JudicialCommitteMember extends StatelessWidget {
  JudicialCommitteMember({
    Key? key,
  });
  final controller = Get.put(AppController());
  final ourInformationController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> judicialCommitteMember =
        controller.electedOffical.where((e) => e.isJudicial == '1').toList();
    // log(judicialCommitteMember.length.toString()+"Mukunda Dhungana");
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? 'न्यायिक समिति' : 'Judicial Committee',
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 10),
          judicialCommitteMember.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  itemCount: judicialCommitteMember.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    var data = judicialCommitteMember[index];
                    return data.judicialDesignation!.np != null
                        ? SizedBox(
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
                                                    imageUrl:
                                                        data.image.toString(),
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                CupertinoActivityIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
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
                                        padding:
                                            const EdgeInsets.only(bottom: 40),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            data.judicialDesignation!.np != null
                                                ? Text(
                                                    controller.isNepali.value
                                                        ? data
                                                            .judicialDesignation!
                                                            .np
                                                            .toString()
                                                        : data
                                                            .judicialDesignation!
                                                            .en
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w800,
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
                          )
                        : const SizedBox();
                  })
        ]),
      ),
    );
  }
}
