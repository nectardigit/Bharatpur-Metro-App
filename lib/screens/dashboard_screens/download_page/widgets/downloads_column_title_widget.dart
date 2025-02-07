import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DownloadsColumnHeaderWidget extends StatelessWidget {
  final Color? color;

  DownloadsColumnHeaderWidget({

    this.color,
  });

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle style = titleStyle.copyWith(fontSize: 16.sp, color: Colors.white);
    return Container(
      color: color ?? Colors.blue,
      width: size.width * 1.4,
      height: size.height * 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(2),
            width: size.width * 0.4,
            child: Text(controller.isNepali.value ? 'शीर्षक' : 'Title',
                textAlign: TextAlign.start, style: style),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            width: size.width * 0.3,
            child: Text(
                controller.isNepali.value ? 'वित्तीय वर्ष' : 'Fiscal Year',
                textAlign: TextAlign.center,
                style: style),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            width: size.width * 0.25,
            child: Text(controller.isNepali.value ? 'दस्तावेजहरु' : 'Documents',
                textAlign: TextAlign.end, style: style),
          ),
        ],
      ),
    );
  }
}
