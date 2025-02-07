import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/nodata.dart';

class NotUploaded extends StatelessWidget {
  const NotUploaded({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(title),
      body: Center(child: buildNodata()),
    );
  }
}
