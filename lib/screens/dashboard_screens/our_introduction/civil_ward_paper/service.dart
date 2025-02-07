import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/civil_ward_paper_model.dart';
import 'package:gandakimun/model/services.dart';
import 'package:gandakimun/widget/appbar.dart';

class ServiceScreen extends StatelessWidget {
   ServiceScreen({
    Key? key,
    required this.servicesData,
  });
  ServicesData servicesData;
  @override
  Widget build(BuildContext context) {
        final controller = Get.put(AppController());
    return  Scaffold(
       appBar: buildAppbar(
        controller.isNepali.value
            ? servicesData.title!.np.toString()
            : servicesData.title!.en.toString(),
      ),
    );
  }
}
