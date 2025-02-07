import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/phones.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'contact_filter.dart';

class EssentialContacts extends StatelessWidget {
  EssentialContacts({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());

    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'जरुरी नम्बरहरु' : 'Essential Contacts'),
      body: Column(
        children: [
          controller.isNepali.value
              ? Expanded(
                  child: FutureBuilder<Phones>(
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
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ContactFilterScreen(
                                      phone: dataList,
                                      index: index,
                                      text: data));
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data),
                                    ),
                                  ),
                                ),
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
                  child: FutureBuilder<Phones>(
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
                              print("daat is $data");
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ContactFilterScreen(
                                    phone: dataList,
                                    index: index,
                                    text: data,
                                  ));
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data),
                                    ),
                                  ),
                                ),
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

  Future<Phones> getData() async {
    final response = await http
        .get(Uri.parse('https://gandakimun.amritsparsha.com/api/phones?id=2'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Phones.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<Phones> getData1() async {
    final response = await http
        .get(Uri.parse('https://gandakimun.amritsparsha.com/api/phones?id=1'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Phones.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
