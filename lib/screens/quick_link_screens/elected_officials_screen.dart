import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/elected_officials.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/box_shadow.dart';
import 'package:gandakimun/widget/custom_dialog.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/nodata.dart';

class ElectedOfficialsScreen extends StatelessWidget {
  ElectedOfficialsScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? 'पदाधिकारी' : "Elected Officials"),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: GetBuilder<HomePageController>(
            builder: (homePageController) => homePageController
                        .electedOfficialsModel.data !=
                    null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                              homePageController
                                  .electedOfficialsModel.data!.length, (index) {
                            var data = homePageController
                                .electedOfficialsModel.data![index];
                            return CustomTile(
                              height: 70,
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage: CachedNetworkImageProvider(
                                    data.image.toString()),
                              ),
                              title: controller.isNepali.value
                                  ? data.name!.np.toString()
                                  : data.name!.en.toString(),
                              subtitle: controller.isNepali.value
                                  ? data.councilDesignation!.np.toString()
                                  : data.councilDesignation!.en.toString(),
                              ontap: () {
                                CustomDialog().showDialog(
                                    context: context,
                                    header: CircleAvatar(
                                      radius: 48,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              data.image.toString()),
                                    ),
                                    title:
                                        "Name: ${controller.isNepali.value ? data.name!.np.toString() : data.name!.en.toString()}",
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Name: ${controller.isNepali.value ? data.name!.np.toString() : data.name!.en.toString()},',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                          Divider(
                                            color: Colors.red.shade300,
                                          ),
                                          Text(
                                              'Designation: ${controller.isNepali.value ? data.councilDesignation!.np.toString() : data.councilDesignation!.en.toString()},',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                          Divider(
                                            color: Colors.red.shade300,
                                          ),
                                          Text(
                                              'Email: ${data.email!.toString()},',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                          Divider(
                                            color: Colors.red.shade300,
                                          ),
                                          Text(
                                              'Phone: ${data.phone!.toString()},',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                          Divider(
                                            color: Colors.red.shade300,
                                          ),
                                          data.wardNumber!.np != null
                                              ? Text(
                                                  'Ward No: ${controller.isNepali.value ? data.wardNumber!.np.toString() : data.wardNumber!.en.toString()},',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.white))
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ]);
                                // Get.to(() => ElectedOfficialsDetails(
                                //       data: data,
                                //     ));
                              },
                            );
                          })
                        ]),
                  )
                : Center(
                    child: buildNodata(),
                  )),
      ),
    );
  }
}

class ElectedOfficialsDetails extends StatelessWidget {
  ElectedOfficialsDetails({Key? key, this.data}) : super(key: key);
  final controller = Get.put(AppController());

  final ElectedOfficalsData? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? 'पदाधिकारी' : "Elected Officials"),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey.shade200,
                  child: CachedNetworkImage(
                    imageUrl: data!.image.toString(),
                    errorWidget: (context, string, dynamic) {
                      return const Icon(Icons.warning);
                    },
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [buildBoxShadow()]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: subtitleStyle,
                        ),
                        Text(
                          'Designation',
                          style: subtitleStyle,
                        ),
                        Text(
                          'Email',
                          style: subtitleStyle,
                        ),
                        Text(
                          'Phone no',
                          style: subtitleStyle,
                        ),
                        Text(
                          'Ward no.',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          controller.isNepali.value
                              ? data!.name!.np.toString()
                              : data!.name!.en.toString(),
                          style: subtitleStyle,
                        ),
                        Text(
                          controller.isNepali.value
                              ? data!.councilDesignation!.np.toString()
                              : data!.councilDesignation!.en.toString(),
                          style: subtitleStyle,
                        ),
                        Text(
                          data!.email!.toString(),
                          style: subtitleStyle,
                        ),
                        Text(
                          data!.phone!.toString(),
                          style: subtitleStyle,
                        ),
                        Text(
                          controller.isNepali.value
                              ? data!.wardNumber!.np.toString()
                              : data!.wardNumber!.en.toString(),
                          style: subtitleStyle,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
