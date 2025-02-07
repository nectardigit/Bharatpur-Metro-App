import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/model/tax.dart';
import 'package:gandakimun/widget/appbar.dart';

import '../../controllers/appcontroller.dart';


class TaxDetailPage extends StatelessWidget {
  final controller = Get.put(AppController());

  TaxData details;
  TaxDetailPage({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(details.toString());
    return Scaffold(
      appBar: buildAppbar(details.title!.np.toString()),
      body: Obx(
        () => Column(
          children: [
            controller.isNepali.isTrue
                ? Text(
                    details.lawType!.np.toString(),
                    style: const TextStyle(fontSize: 15),
                  )
                : Text(
                    details.lawType!.en.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
            controller.isNepali.isTrue
                ? Text(details.lawLevel!.np.toString())
                : Text(details.lawLevel!.en.toString()),
            controller.isNepali.isTrue
                ? Text(details.tags!.np.toString())
                : Text(details.tags!.en.toString()),
          ],
        ),
      ),
    );
  }
}
