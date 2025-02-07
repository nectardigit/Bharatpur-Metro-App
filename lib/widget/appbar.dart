import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';

buildAppbar(title) {
  return AppBar(
    backgroundColor: AppColor.primaryClr,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.white,
        )),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
