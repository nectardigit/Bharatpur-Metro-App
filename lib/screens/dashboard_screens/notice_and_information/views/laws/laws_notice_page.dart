import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/law_type.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/federal.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/law_file_open.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/law_level.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/laws/province_level.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/pdf_widget.dart';
import 'package:get/get.dart';

import 'lawType/policy_law.dart';

class Laws extends StatefulWidget {
  Laws({
    Key? key,
  }) : super(key: key);

  @override
  State<Laws> createState() => _LawsState();
}

class _LawsState extends State<Laws> {
  final controller = Get.put(AppController());

  bool showLawList = false;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller.searchLaw();
    // });
    var list = controller.lawtypeList;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? 'कानुन' : 'Laws'),
      body: Column(
        children: [
          lawheading(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var data = list[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(PolicyLawScreen(
                          lawID: data.id.toString(),
                        ));
                      },
                      child: SizedBox(
                        width: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.description_outlined,
                                size: 65,
                              ),
                              Text(
                                controller.isNepali.value
                                    ? data.name!.np.toString()
                                    : data.name!.en.toString(),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          customTitle(
              controller.isNepali.value
                  ? 'कानूनको लागि छान्नुहोस्'
                  : 'Select for law',
              Colors.blueGrey,
              Alignment.center,
              () {}),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: controller.lawlevelList.length,
              itemBuilder: (context, index) {
                var e = controller.lawlevelList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05.0),
                  child: CustomTile(
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      title: controller.isNepali.value
                          ? '${e.name!.np.toString()} कानुन'
                          : '${e.name!.en.toString()} Laws ',
                      ontap: () {
                        switch (index) {
                          case 0:
                            Get.to(LawLocalLevel());

                            break;
                          case 1:
                            Get.to(LawProvinceLevel());
                            break;
                          case 2:
                            Get.to(LawFederalLevel());
                            break;
                          default:
                        }
                      }),
                );
              }),
          showLawList
              ? Expanded(
                  child: Obx(() => controller.searchLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : controller.searchLaws.isEmpty
                          ? const Text('No Law Found')
                          : Column(
                              children: [
                                Obx(() => Text(
                                    '${controller.searchLaws.length} Result Found')),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: controller.searchLaws.length,
                                      itemBuilder: (context, index) {
                                        var data = controller.searchLaws[index];

                                        return GestureDetector(
                                            onTap: () {
                                              Get.to(LawLocalDetailScreen(
                                                lawData: data,
                                              ));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 05.0),
                                              child: CustomTile(
                                                height: 70,
                                                title: controller.isNepali.value
                                                    ? data.title!.np.toString()
                                                    : data.title!.en.toString(),
                                              ),
                                            ));
                                      }),
                                ),
                              ],
                            )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  ListView lawlocalType() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.lawlevelList.length,
        itemBuilder: (context, index) {
          var e = controller.lawlevelList[index];
          return customTitle(
              controller.isNepali.value
                  ? '${e.name!.np.toString()} कानुन'
                  : '${e.name!.en.toString()} Laws ',
              Colors.blueAccent,
              Alignment.topLeft, () {
            switch (index) {
              case 0:
                Get.to(LawLocalLevel());

                break;
              default:
            }
          });
        });
  }

  GestureDetector customTitle(
      String title, Color color, Alignment alignment, Function ontap) {
    return GestureDetector(
      onTap: () {
        ontap;
      },
      child: Container(
        alignment: alignment,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 05),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Row lawheading() {
    return Row(
      children: [
        Expanded(
            child:
                buildHeading(controller.isNepali.value ? 'कानूनहरु' : 'Laws')),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 10),
            child: TextField(
              controller: controller.searchtxt,
              onSubmitted: (val) {
                controller.searchLaw();
                setState(() {
                  showLawList = true;
                });

                // print(controller.searchtxt.text);
              },
              onChanged: (value) {
                // controller.searchLaw();
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: controller.isNepali.value
                    ? 'कानून खोज्नुहोस्'
                    : 'Search for Law',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding lawType(RxList<LawTypeHeading> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = list[index];
              return SizedBox(
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.description_outlined,
                        size: 65,
                      ),
                      Text(
                        controller.isNepali.value
                            ? data.name!.np.toString()
                            : data.name!.en.toString(),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

openPdf(File file, String url) {
  Get.to(() => PdfWidget(
        file: file,
        url: url,
      ));
}
