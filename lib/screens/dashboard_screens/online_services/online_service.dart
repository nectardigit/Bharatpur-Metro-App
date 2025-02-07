import 'package:flutter/material.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/shimmer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineServiceScreen extends GetView<AppController> {
  OnlineServiceScreen({Key? key});
  @override
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    controller.getOnlineService();
    return Scaffold(
      appBar: buildAppbar(
          controller.isNepali.value ? 'अनलाइन सेवाहरु' : 'Online Services'),
      body: Column(
        children: [
          Obx(() => controller.loadings.isFalse
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.onlineService.length,
                  itemBuilder: (context, index) {
                    var data = controller.onlineService[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          launch(data.link.toString());
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          // color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(controller.isNepali.value
                                ? data.title!.np.toString()
                                : data.title!.en.toString()),
                          ),
                        ),
                      ),
                    );
                  })
              : const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Skelton(height: 160, width: double.infinity),
                ))
        ],
      ),
    );
  }
}
