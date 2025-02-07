// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';

class HealthScreen extends StatelessWidget {
  HealthScreen({Key? key}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    print(controller.healthlist);
    print('pasdsad');
    return Scaffold(
      appBar: buildAppbar(controller.isNepali.isTrue ? 'स्वास्थ्य' : 'Health'),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Obx((() => controller.healthlist.isNotEmpty
            ? controller.loading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : Column(
                    children: [
                      ...List.generate(
                          controller.healthlist.length,
                          (index) => buildTile(
                                controller.isNepali.value
                                    ? controller.healthlist[index].title!.np
                                    : controller.healthlist[index].title!.en,
                                controller.healthlist[index].details!.en != null
                                    ? controller.isNepali.value
                                        ? controller
                                            .healthlist[index].details!.np
                                        : controller
                                            .healthlist[index].details!.en
                                    : '',
                              ))
                    ],
                  )
            : const Center(child: Text('NO Data')))),
      ),
    );
  }

  buildTile(title, details) {
    return Card(
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(9),
        initiallyExpanded: false,
        title: Text(title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: titleStyle),
        children: <Widget>[
          HtmlWidget(
            details,
          ),
        ],
      ),
    );
  }
}
