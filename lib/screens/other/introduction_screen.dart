import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/screens/dashboard_screens/our_introduction/controller/our_information.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/box_shadow.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:html/dom.dart' as dom;

class IntroductionScreen extends GetView<AppController> {
  IntroductionScreen({Key? key}) : super(key: key);

  @override
  final controller = Get.put(AppController());
  final ourInformationController = Get.put(OurInformationController());
  final homecontroller = Get.put(HomeController());
  initState(){
    ourInformationController.fetchIntro();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBody: true,
        backgroundColor: AppColor.backgroundClr,
        appBar: buildAppbar(
            controller.isNepali.value ? 'हाम्रो परिचय' : 'Our Introduction'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildHeading(controller.isNepali.value
                  ? "संक्षिप्त परिचय"
                  : 'Brief Introduction'),
              Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [buildBoxShadow()]),
                  child: Obx(() => ourInformationController.loadingIntro.isTrue
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Skelton(
                            height: 300,
                            width: double.infinity,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: ourInformationController.introlist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Html(
                                    data: controller.isNepali.value
                                        ? ourInformationController
                                            .introlist[index].description!.np
                                            .toString()
                                        : ourInformationController
                                            .introlist[index].description!.en
                                            .toString(),
                                    // onLinkTap: (String? url,
                                    //     RenderContext context,
                                    //     Map<String, String> attributes,
                                    //     dom.Element? element) async {
                                    //   await launchUrl(Uri.parse(url!));
                                    // },
                                    style: {
                                      "body": Style(
                                          fontSize: FontSize(15.sp),
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.justify,
                                          color: Colors.black)
                                    },
                                    // textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Website :",
                                        style: subtitleStyle.copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          homecontroller.makeUrl(
                                              '${ourInformationController.introlist[index].link}');
                                        },
                                        child: Text(
                                          ourInformationController
                                              .introlist[index].link
                                              .toString(),
                                          style: subtitleStyle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Phone Number :",
                                        style: subtitleStyle.copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          homecontroller.makePhoneCall(
                                              "tel:${ourInformationController.introlist[index].phone}");
                                        },
                                        child: Text(
                                          ourInformationController
                                              .introlist[index].phone
                                              .toString(),
                                          style: subtitleStyle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }))),
            ],
          ),
        ));
  }
}
