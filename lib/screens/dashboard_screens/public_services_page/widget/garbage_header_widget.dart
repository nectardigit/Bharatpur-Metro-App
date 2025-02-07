import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

class GarbageHeaderWidget extends StatelessWidget {
  final Color? color;
  GarbageHeaderWidget({
    Key? key,
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
            child: Text(controller.isNepali.value ? 'दिन' : 'Day',
                textAlign: TextAlign.start, style: style),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            width: size.width * 0.5,
            child: Text(controller.isNepali.value ? 'टोल' : 'Toll',
                textAlign: TextAlign.start, style: style),
          ),
        ],
      ),
    );
  }
}
