import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.ontap,
    this.leading,
    this.trailing,
    this.height,
    this.color,
    this.textColor,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Function()? ontap;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: leading,
          onTap: ontap,
          title: Text(
            title,
            style: TextStyle(color: textColor),
          ),
          subtitle: Text(subtitle ?? ''),
          trailing: trailing,
        ),
      ),
    );
  }
}
