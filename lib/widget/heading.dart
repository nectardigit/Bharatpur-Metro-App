import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';

Widget buildHeading(title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString().toUpperCase(),
            maxLines: 1,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(35, 74, 131, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 3,
            width: 50,
            color: AppColor.red,
          )
          // Divider(
          //   color: AppColor.red,
          //   thickness: 3,
          //   endIndent: Device.orientation == Orientation.portrait ? 300 : 650,
          // )
        ],
      ),
    ),
  );
}
