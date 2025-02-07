import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/controllers/staff_login_controller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/inputfield.dart';

import '../../../widget/snackbar.dart';

class KajAavedanScreen extends StatefulWidget {
  const KajAavedanScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<KajAavedanScreen> createState() => _KajAavedanScreenState();
}

class _KajAavedanScreenState extends State<KajAavedanScreen> {
  final controller = Get.put(StaffController());
  final hrmcontroller = Get.put(HrmController());

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  String? selectedValue;
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final visitarea = TextEditingController();
  final visittype = TextEditingController();
  final visitvehicle = TextEditingController();
  final visitplace = TextEditingController();
  final recommededby = TextEditingController();
  final remark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchVisitArea();
    hrmcontroller.fetchVisitType();
    hrmcontroller.fetchVisitVehicle();
    hrmcontroller.fetchRecommender();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'काज क्षेत्र',
                                    style: subtitleStyle,
                                  ),
                                  // customDropdown(),
                                  SizedBox(
                                    height: 55,
                                    // width: MediaQuery.of(context).size.width / 2,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.location_on),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200)),
                                      ),
                                      items: hrmcontroller.visitAreaList
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.text,
                                          onTap: () {
                                            // recommenderId.text = value.id.toString();
                                            // print(recommenderId.text);
                                            visitarea.text =
                                                value.text.toString();
                                          },
                                          child: Text(value.text.toString(),
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
                                  Text(
                                    'भ्रमन गर्ने साधन ',
                                    style: subtitleStyle,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    // width: MediaQuery.of(context).size.width / 2,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.drive_eta_rounded),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200)),
                                      ),
                                      items: hrmcontroller.visitVehicleList
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.text,
                                          onTap: () {
                                            visitvehicle.text =
                                                value.value.toString();
                                          },
                                          child: Text(value.text.toString(),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'जम्मा दिन',
                                    style: subtitleStyle,
                                  ),
                                  const MyInputField(hint: 'hint'),
                                  const SizedBox(
                                    height: 10,
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
                                    'काज प्रकार',
                                    style: subtitleStyle,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    // width: MediaQuery.of(context).size.width / 2,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            Icons.type_specimen_outlined),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200)),
                                      ),
                                      items: hrmcontroller.visitTypeList
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          onTap: () {
                                            visittype.text =
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'भ्रमन गर्ने स्थान(विदेश भए मुलुक र शहर खुला उने)',
                                    style: subtitleStyle,
                                  ),
                                  MyInputField(
                                    hint: 'Visit place',
                                    controller: visitplace,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'मिति सम्म',
                                    style: subtitleStyle,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await controller.selectDate(context);
                                      toDate.text = controller
                                          .selectedDate2.value
                                          .toString();
                                    },
                                    child: MyInputField(
                                      hint: 'select date',
                                      controller: toDate,
                                      enabled: false,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'शिफारिस गर्ने ',
                                    style: subtitleStyle,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    // width: MediaQuery.of(context).size.width / 2,
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.person),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200)),
                                      ),
                                      items: hrmcontroller.recommenderList
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          onTap: () {
                                            recommededby.text =
                                                value.id.toString();
                                          },
                                          child: Text(
                                            value.name.toString(),
                                            style: subtitleStyle,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                                if (visitarea.text.isEmpty ||
                                    fromDate.text.isEmpty ||
                                    toDate.text.isEmpty ||
                                    remark.text.isEmpty ||
                                    recommededby.text.isEmpty) {
                                  getSnackbar(
                                      bgColor: Colors.red,
                                      message: 'Empty Fields');
                                } else {
                                  hrmcontroller.applyForVisit(
                                      visitarea.text,
                                      int.parse(visittype.text),
                                      int.parse(visitvehicle.text),
                                      visitplace.text,
                                      DateTime.parse(fromDate.text)
                                          .toNepaliDateTime()
                                          .toString(),
                                      DateTime.parse(toDate.text)
                                          .toNepaliDateTime()
                                          .toString(),
                                      remark.text,
                                      int.parse(recommededby.text));
                                }
                              })),
                          const SizedBox(
                            width: 20,
                          ),
                          // SizedBox(
                          //     width: 100,
                          //     child: customButton('भ्रमण गर्नुहोस्', () {
                          //       Get.to(() => VisitScreen());
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
