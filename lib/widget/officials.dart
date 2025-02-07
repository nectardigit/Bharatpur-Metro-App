import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/widget/nodata.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';

import 'heading.dart';

class Officials extends StatefulWidget {
  Officials({Key? key}) : super(key: key);

  @override
  State<Officials> createState() => _OfficialsState();
}

class _OfficialsState extends State<Officials> {
  final controller = Get.put(AppController());

  @override
  void initState() {
    controller.fetchElectedOffical();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ElectedOfficalsData> executiveCommitte = [];
    executiveCommitte = controller.electedOffical
        .where((e) => e.isExecutive == 1 && e.condition == 0)
        .toList();
    return Column(
      children: [
        Obx(
          () => buildHeading(
              controller.isNepali.isTrue ? 'पदाधिकारी' : 'Officials'),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => controller.electedLoading.value == true
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Skelton(
                    height: 150,
                    width: double.infinity,
                  ))
              : Center(
                  child: SizedBox(
                      height: 240,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemCount: executiveCommitte.length,
                        itemBuilder: (context, index) {
                          var data = executiveCommitte[index];
                          return data.id != null
                              ? buildOfficialsCard(
                                  data.image,
                                  controller.isNepali.value
                                      ? data.name!.np
                                      : data.name!.en,
                                  controller.isNepali.value
                                      ? data.wardDesignation!.np
                                      : data.wardDesignation!.en,
                                  controller.isNepali.value
                                      ? data.executiveDesignation!.np
                                      : data.executiveDesignation!.en,
                                  data.email,
                                  data.phone)
                              : buildNodata();
                        },
                      )),
                ),
        )
      ],
    );
  }

  buildOfficialsCard(img, String? name, String? wardDesignation,
      String? exucutive, String? email, String? phone) {
    return SizedBox(
      height: 120,
      width: 200,
      child: ListTile(
          title: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              img,
              height: 140,
              fit: BoxFit.fill,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Text(
                  name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                wardDesignation != null
                    ? Text(wardDesignation.toString())
                    : const SizedBox(),
                exucutive != null
                    ? Text(exucutive.toString())
                    : const SizedBox(),
                Text(phone.toString()),
                email != null
                    ? Text(
                        email.toString(),
                        style: const TextStyle(fontSize: 12),
                      )
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }
}
