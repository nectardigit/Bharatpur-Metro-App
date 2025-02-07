import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/introductioncontroller.dart';
import 'package:gandakimun/model/civil_ward_paper_model.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/civil_ward_paper/filter_service.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FilterServiceGroupFromCivil extends StatelessWidget {
  FilterServiceGroupFromCivil({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    final introductionController = Get.put(IntroductionController());
    introductionController.fetchCivilWardPaper();

    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? 'नागरिक वडापत्र' : 'Civil Ward Paper',
      ),
      body: Column(
        children: [
          controller.isNepali.value
              ? Expanded(
                  child: FutureBuilder<CivilWardPaperModel>(
                      future: getData(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          final dataList = snapshot.data;
                          final textList = dataList!.data!.entries
                              .map((e) => e.key)
                              .toList();
                          return ListView.builder(
                            itemCount: textList.length,
                            itemBuilder: (context, index) {
                              var data = textList[index];
                              return CustomTile(
                                ontap: () {
                                  Get.to(ServicesFilterScreen(
                                      datum: dataList,
                                      index: index,
                                      text: data));
                                },
                                title: data,
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              itemCount: 8,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const Skelton(
                                    height: 50, width: double.infinity);
                              },
                            ),
                          );
                        }
                      })),
                )
              : Expanded(
                  child: FutureBuilder<CivilWardPaperModel>(
                      future: getData1(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          final dataList = snapshot.data;
                          final textList = dataList!.data!.entries
                              .map((e) => e.key)
                              .toList();

                          return ListView.builder(
                            itemCount: textList.length,
                            itemBuilder: (context, index) {
                              var data = textList[index];
                              return CustomTile(
                                ontap: () {
                                  switch (index) {
                                    case 0:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'नागरिकता सम्बन्धी',
                                      ));

                                      break;
                                    case 1:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'व्यक्तिगत घटना दर्ता र अभिलेख',
                                      ));

                                      break;
                                    case 2:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'जग्गा प्रशासन सम्बन्धी',
                                      ));

                                      break;
                                    case 3:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'अन्य सेवा',
                                      ));

                                      break;
                                    case 4:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'शैक्षिक सिफारिस',
                                      ));

                                      break;
                                    case 5:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'स्थानीय न्यायिक सेवा',
                                      ));

                                      break;
                                    case 6:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'सहकारी संस्था सम्बन्धी',
                                      ));

                                      break;
                                    case 7:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'व्यवसाय दर्ता र नियमन',
                                      ));

                                      break;
                                    case 8:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'घर नक्सा इजाजत सम्बन्धी',
                                      ));

                                      break;
                                    case 9:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'सामाजिक सुरक्षा र सेवाहरु',
                                      ));

                                      break;
                                    case 10:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'भू- सेवा',
                                      ));

                                      break;
                                    case 11:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'योजना संचालन',
                                      ));

                                      break;
                                    case 12:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'कृषि/पशु सेवा',
                                      ));

                                      break;
                                    case 13:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'स्वास्थ्य सेवा सम्बन्धी',
                                      ));

                                      break;
                                    case 14:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'उद्योग',
                                      ));

                                      break;
                                    case 15:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text:
                                            'लक्षित वर्गको सामाजिक सुरक्षा सम्बन्धी',
                                      ));

                                      break;
                                    case 16:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'संघसंस्था, सहकारी र समूह',
                                      ));

                                      break;
                                    case 17:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'उपयोगिता सेवा सम्बन्धी सिफारिस',
                                      ));

                                      break;
                                    case 18:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'श्रम तथा रोजगारी',
                                      ));

                                      break;
                                    case 19:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'राजश्व भुक्तानी सम्बन्धी',
                                      ));

                                      break;
                                    case 20:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text: 'व्यक्तिगत घटना सम्बन्धी अभिलेख',
                                      ));

                                      break;
                                    case 21:
                                      Get.to(ServicesFilterScreen(
                                        datum: dataList,
                                        index: index,
                                        text:
                                            'शिक्षा युवा र खेलकुद क्षेत्र सँग सम्बन्धित',
                                      ));

                                      break;
                                    default:
                                  }
                                },
                                title: data,
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              itemCount: 8,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const Skelton(
                                    height: 50, width: double.infinity);
                              },
                            ),
                          );
                        }
                      })),
                ),
        ],
      ),
    );
  }

  Future<CivilWardPaperModel> getData() async {
    final response = await http
        .get(Uri.parse('https://gandakimun.amritsparsha.com/api/civil?id=2'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return CivilWardPaperModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<CivilWardPaperModel> getData1() async {
    final response = await http
        .get(Uri.parse('https://gandakimun.amritsparsha.com/api/civil?id=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return CivilWardPaperModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
