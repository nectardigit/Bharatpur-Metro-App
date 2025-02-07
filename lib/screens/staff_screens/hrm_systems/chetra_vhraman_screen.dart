import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/controllers/staff_login_controller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/snackbar.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/inputfield.dart';

class ChetraVhramanScreen extends StatelessWidget {
  ChetraVhramanScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  final controller = Get.put(StaffController());
  final hrmcontroller = Get.put(HrmController());
  final toDate = TextEditingController();
  final fromTime = TextEditingController();
  final toTime = TextEditingController();
  final remark = TextEditingController();
  final recommenderId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchRecommender();
    return Scaffold(
      appBar: buildAppbar(title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => hrmcontroller.loading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'क्षेत्र भ्रमण मिति',
                                    style: subtitleStyle,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await controller.selectDate(context);
                                      toDate.text = controller
                                          .selectedDate.value
                                          .toString();
                                    },
                                    child: MyInputField(
                                      hint: 'select date',
                                      controller: toDate,
                                      enabled: false,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'समय देखी',
                                    style: subtitleStyle,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await controller.selectTime(context);
                                      final time =
                                          controller.selectedTime.value;
                                      fromTime.text =
                                          // localizations
                                          //     .formatTimeOfDay(controller.pick2.value)
                                          //     .toString();
                                          "${time.hour}:${time.minute}";
                                      // controller.selectedTime2.value.toString();
                                    },
                                    child: MyInputField(
                                      hint: '-- --',
                                      controller: fromTime,
                                      enabled: false,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'सिफरिस कर्ता',
                                    style: subtitleStyle,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    // width: MediaQuery.of(context).size.width / 2,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.person),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200)),
                                      ),
                                      isExpanded: true,
                                      items: hrmcontroller.recommenderList
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          onTap: () {
                                            recommenderId.text =
                                                value.id.toString();
                                          },
                                          child: Text(value.name.toString(),
                                              style: subtitleStyle),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        'छान्नुहोस',
                                        style: subtitleStyle,
                                      ),
                                      onChanged: (v) {
                                        // print(controller.countryId.text);
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'समय सम्म ',
                                    style: subtitleStyle,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await controller.selectTime2(context);
                                      final localizations =
                                          MaterialLocalizations.of(context);
                                      final time =
                                          controller.selectedTime2.value;
                                      toTime.text =
                                          // localizations
                                          //     .formatTimeOfDay(controller.pick2.value)
                                          //     .toString();
                                          "${time.hour}:${time.minute}";
                                      // controller.selectedTime2.value.toString();
                                    },
                                    child: MyInputField(
                                      hint: '-- --',
                                      controller: toTime,
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'विवरण',
                        style: subtitleStyle,
                      ),
                      MyInputField(
                        hint: 'विवरण',
                        ismultiline: true,
                        controller: remark,
                      ),
                      // Text(
                      //   'कागजात सङ्लग्न',
                      //   style: subtitleStyle,
                      // ),
                      // SizedBox(width: 150, child: customButton('choose file', () {})),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 100,
                              child: customButton('रख्नुहोस', () {
                                if (toDate.text.isEmpty ||
                                    fromTime.text.isEmpty ||
                                    toTime.text.isEmpty ||
                                    remark.text.isEmpty ||
                                    recommenderId.text.isEmpty) {
                                  getSnackbar(
                                      message: 'Empty Fields',
                                      bgColor: Colors.red);
                                } else {
                                  hrmcontroller.applyForField(
                                      DateTime.parse(toDate.text)
                                          .toNepaliDateTime()
                                          .toString(),
                                      fromTime.text,
                                      toTime.text,
                                      remark.text,
                                      int.parse(recommenderId.text));
                                }
                              })),
                          const SizedBox(
                            width: 20,
                          ),
                          // SizedBox(
                          //     width: 100,
                          //     child: customButton('क्षेत्र भ्रमण', () {
                          //       Get.to(() => FieldVisitScreen());
                          //     }))
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
