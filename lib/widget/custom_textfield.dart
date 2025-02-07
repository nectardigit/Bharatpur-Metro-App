import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {Key? key,
      required this.label,
      this.icon,
      this.controller,
      this.validator})
      : super(key: key);
  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.blueGrey),
            label: Text(
              label,
              style: subtitleStyle.copyWith(color: Colors.blueGrey),
            )),
      ),
    );
  }
}
