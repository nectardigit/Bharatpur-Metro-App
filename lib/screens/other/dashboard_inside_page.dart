// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/widget/appbar.dart';

import '../../widget/box_shadow.dart';

class DashBoardInsidePage extends StatelessWidget {
  final String appBarTitle;
  final Widget widget;
  const DashBoardInsidePage(
      {Key? key, required this.appBarTitle, required this.widget})
      : super(key: key);

  // final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(appBarTitle),
      body: RefreshIndicator(
        onRefresh: () async {
          // await Future.delayed(const Duration(seconds: 2));
          // controller.initializer();
        },
        child: DefaultTabController(
          length: 4,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [widget],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCard(title, IconData icon, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 35.w,
        width: 45.w,
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: [buildBoxShadow()]),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColor.primaryClr,
                size: 30.sp,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
