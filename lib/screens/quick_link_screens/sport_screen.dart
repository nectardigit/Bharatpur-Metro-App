import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';

class SportScreen extends StatelessWidget {
  SportScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.value ? 'खेलकुद' : 'Sports'),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Obx(() => controller.sportlist.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(controller.sportlist.length, (index) {
                      var data = controller.sportlist[index];
                      return Card(
                        child: ListTile(
                          title: Text(controller.isNepali.value
                              ? data.title!.np.toString()
                              : data.title!.en.toString()),
                          subtitle: Html(
                            shrinkWrap: true,
                            data: controller.isNepali.value
                                ? data.description!.np.toString()
                                : data.description!.en.toString(),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              )
            : buildNodata()),
      ),
    );
  }
}
