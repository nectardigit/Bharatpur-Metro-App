import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';

class MyInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? ismultiline;
  final bool? enabled;
  final bool? obscuretext;
  final Widget? suffix;
  final FormFieldValidator? validator;

  const MyInputField(
      {Key? key,
      required this.hint,
      this.controller,
      this.widget,
      this.ismultiline = false,
      this.suffix,
      this.validator,
      this.enabled = true,
      this.obscuretext = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(

          //margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.only(left: 14),
          height: ismultiline! ? 160 : 50,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.1), width: 0.0),
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade200,
          ),
          alignment: Alignment.center,
          child: Row(children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                readOnly: widget == null ? false : true,
                autofocus: false,
                enabled: enabled,
                cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                controller: controller,
                style: subtitleStyle,
                validator: validator,
                minLines: ismultiline! ? 2 : 1,
                maxLines: ismultiline! ? 6 : 1,
                obscureText: obscuretext!,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  errorStyle:
                      subtitleStyle.copyWith(color: Colors.red, fontSize: 10),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: hint,
                  hintStyle: subtitleStyle.copyWith(color: Colors.grey),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  suffixIcon: suffix,
                ),
              ),
            ),
            widget == null ? Container() : Container(child: widget)
          ]))
    ]);
  }
}
