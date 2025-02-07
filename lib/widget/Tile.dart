import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';

buildTile() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(5)),
    child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'no data',
          style: subtitleStyle,
        )),
  );
}
