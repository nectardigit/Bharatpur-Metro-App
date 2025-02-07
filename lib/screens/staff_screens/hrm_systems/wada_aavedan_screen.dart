import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/staff_login_controller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/custom_drop.dart';
import 'package:gandakimun/widget/inputfield.dart';

class WadaAavedanScreen extends StatefulWidget {
  const WadaAavedanScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WadaAavedanScreen> createState() => _WadaAavedanScreenState();
}

class _WadaAavedanScreenState extends State<WadaAavedanScreen> {
  final controller = Get.put(StaffController());

  final fromDate = TextEditingController();
  final toDate = TextEditingController();

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(widget.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'विदा प्रकार',
                style: subtitleStyle,
              ),
              customDropdown(),
              // Obx(
              //   () => DropdownButtonHideUnderline(
              //     child: DropdownButton2(
              //       hint: Text(
              //         'Select Item',
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Theme.of(context).hintColor,
              //         ),
              //       ),
              //       items: items
              //           .map((item) => DropdownMenuItem<String>(
              //                 value: item,
              //                 child: Text(
              //                   item,
              //                   style: const TextStyle(
              //                     fontSize: 14,
              //                   ),
              //                 ),
              //               ))
              //           .toList(),
              //       value: controller.selectedValue.value,
              //       onChanged: (value) {
              //         setState(() {
              //           selectedValue = value as String;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'मिति देखी',
                          style: subtitleStyle,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.selectDate(context);
                            fromDate.text =
                                controller.selectedDate.value.toString();
                          },
                          child: MyInputField(
                            hint: 'select date',
                            controller: fromDate,
                            enabled: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'मिति सम्म',
                          style: subtitleStyle,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.selectDate(context);
                            toDate.text =
                                controller.selectedDate2.value.toString();
                          },
                          child: MyInputField(
                            hint: 'select date',
                            controller: toDate,
                            enabled: false,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'सिफरिस गर्ने ',
                style: subtitleStyle,
              ),
              SizedBox(
                width: 50.sp,
                child: customDropdown(),
              ),

              const SizedBox(
                height: 20,
              ),
              Text(
                'विवरण',
                style: subtitleStyle,
              ),
              const MyInputField(
                hint: 'विवरण',
                ismultiline: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'कागजात सङ्लग्न',
                style: subtitleStyle,
              ),
              SizedBox(width: 150, child: customButton('choose file', () {})),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 100, child: customButton('रख्नुहोस', () {})),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      width: 100, child: customButton('बन्द गर्नुहोस', () {}))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
