// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_button.dart';

import '../../utils/validators.dart';
import '../../widget/box_shadow.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/snackbar.dart';

class RegisterComplaintAndProblem extends StatelessWidget {
  RegisterComplaintAndProblem({Key? key}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value
          ? 'शुजब तथा समस्य दार्ता गरौना'
          : 'Register a complaint or a problem'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCard('समस्य तथा सुजव दार्ता गरौने', Icons.note_alt_outlined,
                () {
              Get.to(() => SamasyaDarta());
            }),
            buildCard('समस्य तथा सुजव हेर्ने', Icons.content_paste_search_sharp,
                () {
              Get.to(() => const GunasoSuchi());
            })
          ],
        ),
      )),
    );
  }

  buildCard(title, IconData icon, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 35.w,
        width: 45.w,
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: [buildBoxShadow()]),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColor.primaryClr,
                size: 30.sp,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SamasyaDarta extends StatefulWidget {
  const SamasyaDarta({Key? key}) : super(key: key);

  @override
  State<SamasyaDarta> createState() => _SamasyaDartaState();
}

class _SamasyaDartaState extends State<SamasyaDarta> {
  final controller = Get.put(HomeController());

  final appcontroller = Get.put(AppController());

  final complaintTypes = TextEditingController();

  final complaintDescription = TextEditingController();

  final suggestionDescription = TextEditingController();

  final name = TextEditingController();

  final email = TextEditingController();

  final address = TextEditingController();

  final phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: AppBar(
        centerTitle: true,
        title: Text(appcontroller.isNepali.value
            ? 'गुनासो, सुझाव तथा प्रतिक्रियाा'
            : 'Complaints, suggestions and feedback'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      value: dropdownValue,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      hint: const Text('Select Problem'),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Complaints',
                        'Suggestions',
                        'Feedback',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appcontroller.isNepali.value
                        ? 'गुनासोको प्रकार'
                        : 'Message Types',
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (val) => validateIsEmpty(string: val.toString()),
                    controller: complaintTypes,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appcontroller.isNepali.value
                        ? 'गुनासोको संक्षिप्त विवरण'
                        : 'A Brief Description of the Complaint',
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: complaintDescription,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: '',
                        hintStyle: subtitleStyle.copyWith(
                            color: Colors.black.withOpacity(0.5)),
                        border: const OutlineInputBorder()),
                    validator: (val) => validateIsEmpty(string: val.toString()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    appcontroller.isNepali.value
                        ? 'समाधानको लागी  सुझाव'
                        : 'Suggestions for Solutions',
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: suggestionDescription,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '',
                      border: const OutlineInputBorder(),
                      hintStyle: subtitleStyle.copyWith(
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    validator: (val) => validateIsEmpty(string: val.toString()),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      appcontroller.isNepali.value
                          ? 'अत्तिरिक्त् कागजात अप्लोअद गर्नुहोस् (यधी कुनै हो भने) '
                          : 'Upload additional documents (if required)',
                      style: subtitleStyle,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.warning_amber_rounded,
                          size: 30,
                          color: Colors.amber,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.getImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryClr,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_photo_alternate_outlined,
                                  color: AppColor.primaryClr,
                                ),
                                Text(
                                  appcontroller.isNepali.value
                                      ? 'फोटो चयन गर्नुहोस्'
                                      : 'Select a photo',
                                  style: subtitleStyle.copyWith(
                                      color: AppColor.primaryClr),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.getFile();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.primaryClr,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_link_outlined,
                                  color: AppColor.primaryClr,
                                ),
                                Text(
                                  appcontroller.isNepali.value
                                      ? 'फाइल संलग्न गर्नुहोस्'
                                      : 'Attach a file',
                                  style: subtitleStyle.copyWith(
                                      color: AppColor.primaryClr),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() => controller.selectedImagePath != ""
                      ? Text(controller.selectedImagePath.toString())
                      : Container()),
                  Obx(() => controller.selectedFilePath != ""
                      ? Text(controller.selectedFilePath.toString())
                      : Container()),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      appcontroller.isNepali.value
                          ? 'के तपाईं आफ्नो व्यक्तिगत विवरण प्रदान गर्न चाहनुहुन्छ ?'
                          : 'Would you like to share your personal information?',
                      style: subtitleStyle,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.warning_amber_rounded,
                          size: 30,
                          color: Colors.amber,
                        )),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          color: controller.yes.value
                              ? Colors.amber
                              : Colors.transparent,
                          onPressed: () {
                            controller.yes.value = true;
                          },
                          child:
                              Text(appcontroller.isNepali.value ? 'हो' : 'Yes'),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        MaterialButton(
                          color: controller.yes.value
                              ? Colors.transparent
                              : Colors.amber,
                          onPressed: () {
                            controller.yes.value = false;
                          },
                          child:
                              Text(appcontroller.isNepali.value ? 'छैन' : 'No'),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => controller.yes.value
                      ? Column(
                          children: [
                            CustomTextfield(
                              label:
                                  appcontroller.isNepali.value ? 'नाम' : 'Name',
                              icon: Icons.person,
                              controller: name,
                              validator: (val) =>
                                  validateIsEmpty(string: val.toString()),
                            ),
                            CustomTextfield(
                              label: appcontroller.isNepali.value
                                  ? 'ठेगान '
                                  : 'Address',
                              icon: Icons.location_on,
                              controller: address,
                              validator: (val) =>
                                  validateIsEmpty(string: val.toString()),
                            ),
                            CustomTextfield(
                              label: appcontroller.isNepali.value
                                  ? 'नम्बर'
                                  : 'Phone Number',
                              icon: Icons.phone,
                              controller: phone,
                              validator: (val) =>
                                  validateIsEmpty(string: val.toString()),
                            ),
                            CustomTextfield(
                              label: appcontroller.isNepali.value
                                  ? 'ईमेल'
                                  : 'Email',
                              icon: Icons.mail,
                              controller: email,
                              validator: (val) =>
                                  validateIsEmpty(string: val.toString()),
                            ),
                            CustomTextfield(
                              label: appcontroller.isNepali.value
                                  ? 'फ्याक्स नम्बर'
                                  : ' Fax No:',
                              icon: Icons.fax,
                              validator: (val) =>
                                  validateIsEmpty(string: val.toString()),
                            )
                          ],
                        )
                      : Container()),
                  customButton(
                    appcontroller.isNepali.value ? 'पेश गर्नुहोस् ' : 'Submit',
                    () {
                      if (_formKey.currentState!.validate()) {
                        appcontroller.postProblemStatement(
                          dropdownValue,
                          complaintTypes.text.trim(),
                          complaintDescription.text.trim(),
                          name.text,
                          email.text,
                          controller.selectedImagePath.toString(),
                          address.text,
                          phone.text,
                          suggestionDescription.text,
                        );
                      } else {
                        getSnackbar(
                            bgColor: AppColor.red, message: 'दर्ता असफल');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GunasoSuchi extends StatelessWidget {
  const GunasoSuchi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar('गुनसो सुची'),
    );
  }
}
