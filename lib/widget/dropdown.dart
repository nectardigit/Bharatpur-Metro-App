import 'package:flutter/material.dart';

import '../constants.dart';

buildDropdown(title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        Text(
          title,
          style: subtitleStyle.copyWith(color: Colors.blueGrey),
        ),
        Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'चन्नुहोस्',
                style: subtitleStyle,
              ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                size: 30,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
