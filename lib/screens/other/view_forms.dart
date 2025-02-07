import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/formview.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/widget/heading.dart';
import 'package:gandakimun/widget/nodata.dart';

class FormViewScreen extends StatelessWidget {
  FormViewScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? "फारमहरु हेर्नुहोस्" : 'View forms'),
      body: SingleChildScrollView(
        child: Obx(() => controller.formviewlist.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  ...List.generate(controller.formviewlist.length, (index) {
                    var data = controller.formviewlist[index];
                    return CustomTile(
                            title: controller.isNepali.value
                                ? data.title!.np.toString()
                                : data.title!.en.toString(),
                            subtitle: controller.isNepali.value
                                ? data.description!.toString()
                                : data.description.toString(),
                            ontap: () {
                              Get.to(() => FormDetails(
                                    data: data,
                                  ));
                            },
                          );
                  })
                ]),
              )
            : buildNodata()),
      ),
    );
  }
}

class FormDetails extends StatelessWidget {
  const FormDetails({Key? key, this.data}) : super(key: key);
  final FormviewData? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(data!.title!.np),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading(data!.title!.en),
            const SizedBox(
              height: 10,
            ),
            Text('Description: ${data!.description!.en}'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }
}
