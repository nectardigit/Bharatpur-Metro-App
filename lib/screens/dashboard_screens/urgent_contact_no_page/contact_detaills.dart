import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/model/phones.dart';
import 'package:gandakimun/widget/appbar.dart';

import 'package:gandakimun/widget/heading.dart';

class ContactDetails extends StatelessWidget {
  final PhoneData phonesData;
  const ContactDetails({Key? key, required this.phonesData});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());
    final controller = Get.put(AppController());

    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value
          ? phonesData.name!.np.toString()
          : phonesData.name!.en.toString()),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          buildHeading(
            controller.isNepali.value
                ? phonesData.name!.np
                : phonesData.name!.en,
          ),
          const Divider(
            thickness: 2,
          ),
          Card(
            margin: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(controller.isNepali.value
                  ? phonesData.name!.np.toString()
                  : phonesData.name!.en.toString()),
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          homecontroller
                              .makePhoneCall("tel:${phonesData.phone!.en}");
                        },
                        child: Text(phonesData.phone!.en.toString())),
                    phonesData.phone!.np != null
                        ? GestureDetector(
                            onTap: () {
                              homecontroller
                                  .makePhoneCall("tel:${phonesData.phone!.np}");
                            },
                            child: Text(phonesData.phone!.np.toString()),
                          )
                        : const SizedBox(),
                  ]),
            ),
          ),
          // CustomTile(
          //   height: 70,
          //   title: controller.isNepali.value
          //       ? phonesData.name!.np.toString()
          //       : phonesData.name!.en.toString(),
          //   subtitle: phonesData.phone!.en.toString(),
          //   ontap: () {
          //     homecontroller.makePhoneCall("tel:${phonesData.phone!.en}");
          //   },
          // ),
          // phonesData.phone!.np != null
          //     ? CustomTile(
          //         height: 70,
          //         title: controller.isNepali.value
          //             ? phonesData.contgroup!.np.toString()
          //             : phonesData.contgroup!.en.toString(),
          //         subtitle: phonesData.phone!.np.toString(),
          //         ontap: () {
          //           homecontroller.makePhoneCall("tel:${phonesData.phone!.np}");
          //         },
          //       )
          //     : const SizedBox()
        ],
      ),
    );
  }
}
