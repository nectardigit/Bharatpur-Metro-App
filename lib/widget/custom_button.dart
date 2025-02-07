import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.ontap})
      : super(key: key);

  final String title;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ontap,
      height: 27.sp,
      elevation: 3,
      color: AppColor.primaryClr,
      child: Text(title, style: subtitleStyle.copyWith(color: Colors.white)),
    );
  }
}

SizedBox customButton(title, ontap) {
  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: ontap,
      height: 27.sp,
      elevation: 3,
      color: AppColor.primaryClr,
      child: Text(title, style: subtitleStyle.copyWith(color: Colors.white)),
    ),
  );
}
