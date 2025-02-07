import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/organization_structure/organization_structure_details.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';

class OrganizationStructure extends StatelessWidget {
  OrganizationStructure({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(AppController());
  final ourInformationController = Get.put(OurInformationController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var list = ourInformationController.organizationStructureList;

    ourInformationController.fetchOrganizationStructure();
    return Scaffold(
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(controller.isNepali.value
            ? 'संगठन संरचना'
            : 'Organization structure'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(controller.isNepali.value
                  ? "संगठन संरचना"
                  : 'Organization structure'),
              const SizedBox(height: 10),
              Obx(
                () => ourInformationController.loadingOrganization.isTrue
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const Skelton(
                                height: 50, width: double.infinity);
                          },
                        ),
                      )
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final reversedIndex = list.length - 1 - index;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OrganizationStructureButton(
                            onPressed: () {
                              Get.to(OrganizationDetailsPage(
                                list: list[reversedIndex],
                              ));
                            },
                            controller: controller,
                            npText: list[reversedIndex].heading!.np.toString(),
                            enText: list[reversedIndex].heading!.en.toString(),
                          ),
                        );
                      },
                    )),
            ],
          ),
        ));
  }
}

class OrganizationStructureButton extends StatelessWidget {
  final AppController controller;
  final String npText;
  final String enText;
  final Function() onPressed;
  const OrganizationStructureButton({
    Key? key,
    required this.controller,
    required this.npText,
    required this.enText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(350, 50),
          maximumSize: const Size(400, 50),
        ),
        onPressed: onPressed,
        child: Text(controller.isNepali.value ? npText : enText),
      ),
    );
  }
}
