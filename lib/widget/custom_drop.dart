import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';

customDropdown() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'छान्नुहोस',
            style: subtitleStyle,
          ),
          const Icon(Icons.arrow_drop_down_sharp)
        ],
      ),
    ),
  );
}
