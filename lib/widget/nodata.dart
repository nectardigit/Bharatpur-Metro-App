import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';

buildNologin({txt}) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.red,
            child: Icon(
              Icons.login,
              color: Colors.white,
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          txt ?? 'यो सेवा अहेले प्रकृया मा छ ।',
          style: subtitleStyle,
        ),
      ],
    ),
  );
}

buildNodata({txt}) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.red,
            child: Icon(
              Icons.close,
              color: Colors.white,
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          txt ?? 'अपलोड हुन बाकी',
          style: subtitleStyle,
        ),
      ],
    ),
  );
}
