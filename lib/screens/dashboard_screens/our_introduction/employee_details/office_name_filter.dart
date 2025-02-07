import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/new_office.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/employee_details/municipal_executive.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OfficeNameFilterScreen extends StatelessWidget {
  OfficeNameFilterScreen({
    Key? key,
    // required this.officeTypeHeadingModel,
  });

  // OfficeTypeHeadingModel officeTypeHeadingModel;
  // String text;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
        controller.isNepali.value ? "कार्यालयहरू" : "Offices",
      ),
      body: Column(
        children: [
          controller.isNepali.value
              ? Expanded(
                  child: FutureBuilder<OfficeModelScreen>(
                  future: getData2(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dataList = snapshot.data;
                      final textList =
                          dataList!.data!.entries.map((e) => e.key).toList();
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: textList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = textList[index];
                            print(data);
                            return ListTile(
                              onTap: () {
                                Get.to(ExecutiveScreen(
                                  text: data,
                                ));
                              },
                              title: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(data),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ))
              : Expanded(
                  child: FutureBuilder<OfficeModelScreen>(
                  future: getData1(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dataList = snapshot.data;
                      final textList =
                          dataList!.data!.entries.map((e) => e.key).toList();

                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: textList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = textList[index];
                            return data.isEmpty
                                ? const SizedBox()
                                : ListTile(
                                    onTap: () {
                                      Get.to(ExecutiveScreen(
                                        text: data,
                                      ));
                                    },
                                    title: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(data),
                                      ),
                                    ),
                                  );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),

          // : Center(
          //     child: Image.asset('assets/nodata.jpg'),
          //   )
        ],
      ),
    );
  }

  Future<OfficeModelScreen> getData1() async {
    final response = await http
        .get(Uri.parse('https://gandakimun.amritsparsha.com/api/office?id=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return OfficeModelScreen.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<OfficeModelScreen> getData2() async {
    final response = await http
        .get(Uri.parse('https://gandakimun.amritsparsha.com/api/office?id=2'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return OfficeModelScreen.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
