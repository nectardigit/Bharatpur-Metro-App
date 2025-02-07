import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/staff_login_controller.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/custom_drop.dart';
import 'package:gandakimun/widget/inputfield.dart';

import '../../../widget/appbar.dart';

class ItemRequestScreen extends StatelessWidget {
  ItemRequestScreen({Key? key}) : super(key: key);

  final controller = Get.put(StaffController());

  final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('Item Request Form button'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: subtitleStyle,
              ),
              GestureDetector(
                onTap: () async {
                  await controller.selectDate(context);
                  date.text = controller.selectedDate.value.toString();
                },
                child: MyInputField(
                  hint: 'select date',
                  controller: date,
                  enabled: false,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Item Request no.',
                style: subtitleStyle,
              ),
              const MyInputField(hint: ''),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Item Group',
                style: subtitleStyle,
              ),
              customDropdown(),
              // MyInputField(hint: ''),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Item Name',
                style: subtitleStyle,
              ),
              customDropdown(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Specification',
                style: subtitleStyle,
              ),
              customDropdown(),
              const SizedBox(
                height: 10,
              ),
              customButton('Add', () {}),
              const SizedBox(
                height: 10,
              ),
              _buildTable(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Usage',
                style: subtitleStyle,
              ),
              const MyInputField(hint: ''),
              const SizedBox(
                height: 10,
              ),
              customButton('Save button', () {}),
            ],
          ),
        ),
      ),
    );
  }

  _buildTable() {
    return Table(
      border: TableBorder.all(width: 1, color: Colors.black),
      children: [
        TableRow(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Item Name',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Specification',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Quantity',
                  style: subtitleStyle,
                ),
              ),
            ]),
        TableRow(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
            ]),
        TableRow(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black38)),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '',
                  style: subtitleStyle,
                ),
              ),
            ]),
      ],
    );
  }
}
