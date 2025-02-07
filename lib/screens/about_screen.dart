import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar('एप्प्सको बारेमा'),
        body: controller.aboutlist.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                      1,
                      (index) => Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: CachedNetworkImage(
                                    imageUrl: controller
                                        .aboutlist[index].companyLogo
                                        .toString(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildAboutTile(
                                    'Company name:',
                                    controller
                                        .aboutlist[index].companyName!.en),
                                buildAboutTile('Email:',
                                    controller.aboutlist[index].email),
                                buildAboutTile('Phone:',
                                    controller.aboutlist[index].phone),
                                buildAboutTile('Alt Phone',
                                    controller.aboutlist[index].altPhone),
                                buildAboutTile('Facebook:',
                                    controller.aboutlist[index].fbLink),
                                buildAboutTile('Instagram:',
                                    controller.aboutlist[index].instagramLink),
                              ],
                            ),
                          ))
                ],
              )
            : const Center(
                child: Text('No data'),
              ));
  }

  buildAboutTile(label, data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: subtitleStyle,
          ),
          Text(data, style: subtitleStyle.copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
