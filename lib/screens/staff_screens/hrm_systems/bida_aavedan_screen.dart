import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/controllers/staff_login_controller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/inputfield.dart';
import 'package:gandakimun/widget/snackbar.dart';

class BidaAavedanScreen extends StatefulWidget {
  const BidaAavedanScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BidaAavedanScreen> createState() => _BidaAavedanScreenState();
}

class _BidaAavedanScreenState extends State<BidaAavedanScreen> {
  final controller = Get.put(StaffController());
  final hrmcontroller = Get.put(HrmController());

  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final remarks = TextEditingController();
  final leaveId = TextEditingController();
  final recommenderId = TextEditingController();
  final halfday = TextEditingController();

//textcontroolerer

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchLeaveType();
    hrmcontroller.fetchRecommender();
    hrmcontroller.fetchLeave();
    return Scaffold(
      appBar: buildAppbar(widget.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => hrmcontroller.loading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'विदा प्रकार',
                        style: subtitleStyle,
                      ),

                      // customDropdown(),
                      SizedBox(
                        height: 55,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.type_specimen_outlined),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                          ),
                          items: hrmcontroller.leaveTypeList
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              onTap: () {
                                leaveId.text = value.id.toString();
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
                                    fromDate.text = controller
                                        .selectedDate.value
                                        .toString();
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
                                    toDate.text = controller.selectedDate2.value
                                        .toString();
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
                        height: 55,
                        // width: MediaQuery.of(context).size.width / 2,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                          ),
                          items: hrmcontroller.recommenderList
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              onTap: () {
                                recommenderId.text = value.id.toString();
                                print(recommenderId.text);
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

                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => SwitchListTile(
                            value: hrmcontroller.isHalfday.value,
                            title: Text(
                              'Half-day',
                              style: subtitleStyle,
                            ),
                            activeColor: AppColor.primaryClr,
                            onChanged: (val) {
                              hrmcontroller.isHalfday(val);
                              halfday.text =
                                  hrmcontroller.isHalfday.value.toString();
                              print(halfday.text);
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'विवरण',
                        style: subtitleStyle,
                      ),
                      MyInputField(
                        hint: 'विवरण',
                        ismultiline: true,
                        controller: remarks,
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'कागजात सङ्लग्न',
                      //   style: subtitleStyle,
                      // ),
                      // SizedBox(
                      //     width: 150,
                      //     child: customButton('choose file', () {})),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 100,
                              child: customButton('रख्नुहोस', () {
                                if (leaveId.text.isEmpty ||
                                    leaveId.text.isEmpty ||
                                    fromDate.text.isEmpty ||
                                    toDate.text.isEmpty ||
                                    recommenderId.text.isEmpty) {
                                  getSnackbar(
                                      bgColor: Colors.red,
                                      message: 'Empty Fields');
                                } else {
                                  hrmcontroller.applyForLeave(
                                      int.parse(leaveId.text).toInt(),
                                      remarks.text,
                                      DateTime.parse(fromDate.text)
                                          .toNepaliDateTime()
                                          .toString(),
                                      DateTime.parse(toDate.text)
                                          .toNepaliDateTime()
                                          .toString(),
                                      halfday.text == 'true' ? true : false,
                                      int.parse(recommenderId.text).toInt());
                                }
                              })),
                          const SizedBox(
                            width: 20,
                          ),
                          // SizedBox(
                          //     width: 100,
                          //     child: customButton('छुट्टी हेर्नुहोस्', () {
                          //       // hrmcontroller.fetchLeave();
                          //       Get.to(() => LeavesScreen());
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
