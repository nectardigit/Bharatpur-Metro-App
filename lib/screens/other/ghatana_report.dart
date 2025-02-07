import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/utils/validators.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/custom_textfield.dart';
import 'package:gandakimun/widget/snackbar.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../widget/appbar.dart';

class GhatanaReport extends StatelessWidget {
  GhatanaReport({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(
          controller.isNepali.value ? 'घटना रिपोट' : 'Incident report'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            runSpacing: 5,
            spacing: 5,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              buildSuryadayaCard(
                  Icon(
                    Icons.note_add_outlined,
                    size: 30.sp,
                    color: AppColor.primaryClr,
                  ),
                  controller.isNepali.value
                      ? 'घटना दर्ता गर्नुहोस्'
                      : 'Report Incident', () {
                Get.to(() => GhatanaDarta());
              }),
              buildSuryadayaCard(
                  Icon(
                    Icons.car_crash_outlined,
                    size: 30.sp,
                    color: AppColor.primaryClr,
                  ),
                  controller.isNepali.value
                      ? 'सवारी दुर्घटना दर्ता'
                      : 'Car accident registration', () {
                Get.to(() => SawariDhurghatanaDarta());
              }),
            ],
          ),
        ),
      ),
    );
  }

  buildSuryadayaCard(img, title, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: Device.orientation == Orientation.portrait ? 17.h : 40.h,
        width: 45.w,
        decoration: BoxDecoration(
            color: const Color.fromARGB(209, 255, 255, 255),
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img,
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: subtitleStyle,
            )
          ],
        ),
      ),
    );
  }
}

class GhatanaDarta extends StatelessWidget {
  GhatanaDarta({Key? key}) : super(key: key);
  final complaintName = TextEditingController();
  final complainantMobileNumber = TextEditingController();
  final victimName = TextEditingController();
  final victimAddress = TextEditingController();
  final victimPhoneNumber = TextEditingController();
  final incidentAddress = TextEditingController();
  final incidentNature = TextEditingController();
  final culpritName = TextEditingController();
  final culpritAddress = TextEditingController();
  final culpritPhoneNumber = TextEditingController();
  final victimColor = TextEditingController();
  final victimHeight = TextEditingController();
  final victimClothes = TextEditingController();
  final victimClothesColor = TextEditingController();
  final victimCulpritRelation = TextEditingController();
  final incidentDetails = TextEditingController();
  final image = TextEditingController();
  final controller = Get.put(AppController());
  final homeController = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('घटना दर्ता'),
      backgroundColor: AppColor.backgroundClr,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextfield(
                    label: 'उजुरिकार्ताको नाम',
                    icon: Icons.person,
                    controller: complaintName,
                    validator: (val) => validateIsEmpty(string: val)),
                CustomTextfield(
                    label: 'उजुरिकार्ताको नम्बर',
                    icon: Icons.phone,
                    controller: complainantMobileNumber,
                    validator: (val) => validateIsEmpty(string: val)),
                Text(
                  'पिडितको विवरण',
                  style: subtitleStyle.copyWith(color: AppColor.red),
                ),
                CustomTextfield(
                    label: 'पिडितको नाम ',
                    icon: Icons.person,
                    controller: victimName,
                    validator: (val) => validateIsEmpty(string: val)),
                CustomTextfield(
                    label: 'पिडितको ठेगान',
                    icon: Icons.location_on,
                    controller: victimAddress,
                    validator: (val) => validateIsEmpty(string: val)),
                CustomTextfield(
                    label: 'पिडितको नम्बर',
                    icon: Icons.phone,
                    controller: victimPhoneNumber,
                    validator: (val) => validateIsEmpty(string: val)),
                Text(
                  'घटना घटेको मिती दिनुहोस',
                  style: subtitleStyle.copyWith(color: AppColor.red),
                ),
                customButton('मिती चन्नुहोस्', () {
                  homeController.selectDate(context);
                }),
                Obx(() => Text(
                      DateFormat('yyyy-MM-dd')
                          .format(homeController.selectedDate.value),
                      // homeController.selectedDate.value.toLocal().toString(),
                      textAlign: TextAlign.left,
                    )),
                CustomTextfield(
                    label: 'घटना घटेको स्थान',
                    icon: Icons.location_on,
                    controller: incidentAddress,
                    validator: (val) => validateIsEmpty(string: val)),
                CustomTextfield(
                    label: 'घटनाको प्रक्रती',
                    icon: Icons.info_outline,
                    controller: incidentNature,
                    validator: (val) => validateIsEmpty(string: val)),
                Text(
                  'कसुरदारको विवरण',
                  style: subtitleStyle.copyWith(color: AppColor.red),
                ),
                CustomTextfield(
                    label: 'कसुरदारको नाम',
                    icon: Icons.person,
                    controller: culpritName,
                    validator: (val) => validateIsEmpty(string: val)),
                CustomTextfield(
                    label: 'कसुरदारको ठेगान',
                    icon: Icons.location_on,
                    controller: culpritAddress,
                    validator: (val) => validateIsEmpty(string: val)),
                CustomTextfield(
                    label: 'कसुरदारको नम्बर',
                    icon: Icons.phone,
                    controller: culpritPhoneNumber,
                    validator: (val) => validateIsEmpty(string: val)),
                Text(
                  'ghatana ghateko miti dinuhos',
                  style: subtitleStyle.copyWith(color: AppColor.red),
                ),
                CustomTextfield(
                  label: 'रग',
                  icon: Icons.color_lens_rounded,
                  controller: victimColor,
                ),
                CustomTextfield(
                  label: 'उचाइ',
                  icon: Icons.height,
                  controller: victimHeight,
                ),
                CustomTextfield(
                  label: 'लुगा',
                  icon: Icons.color_lens_rounded,
                  controller: victimClothes,
                ),
                CustomTextfield(
                  label: 'लुगाको रग',
                  icon: Icons.color_lens_rounded,
                  controller: victimClothesColor,
                ),
                CustomTextfield(
                  label: 'पिडित र  कसुरदारको सम्बन्ध',
                  icon: Icons.person_pin_rounded,
                  controller: victimCulpritRelation,
                ),
                // buildDropdown('रग'),
                // buildDropdown('उचाइ'),
                // buildDropdown('लुगा'),
                // buildDropdown('लुगाको रग'),
                // buildDropdown('पिडित र  कसुरदारको sambandha'),
                CustomTextfield(
                    label: 'घटनाको विवरण',
                    icon: Icons.person,
                    controller: incidentDetails,
                    validator: (val) => validateIsEmpty(string: val)),
                customButton('फोटो चन्नुहोस्', () {}),
                const SizedBox(
                  height: 10,
                ),
                customButton('दर्ता गर्नुहोस्', () {
                  if (_formKey.currentState!.validate()) {
                    controller.postIncidentRegistrationDetails(
                        complaintName.text,
                        complainantMobileNumber.text,
                        victimName.text,
                        victimAddress.text,
                        victimPhoneNumber.text,
                        incidentAddress.text,
                        incidentNature.text,
                        culpritName.text,
                        culpritAddress.text,
                        culpritPhoneNumber.text,
                        victimColor.text,
                        victimHeight.text,
                        victimClothes.text,
                        victimClothesColor.text,
                        victimCulpritRelation.text,
                        incidentDetails.text,
                        "asdsad.jpg");
                  } else {
                    getSnackbar(bgColor: AppColor.red, message: 'दर्ता असफल');
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SawariDhurghatanaDarta extends StatelessWidget {
  SawariDhurghatanaDarta({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(AppController());
  final homeController = Get.put(HomeController());
  final complaintName = TextEditingController();
  final complaintMobileNumber = TextEditingController();
  final complaintAddress = TextEditingController();
  final date = TextEditingController();
  final hittingVehicleType = TextEditingController();
  final hittingVehicleColor = TextEditingController();
  final hittingVehicleNumber = TextEditingController();
  final hittedVehicleType = TextEditingController();
  final hittedVehicleColor = TextEditingController();
  final hittedVehicleNumber = TextEditingController();
  final accidentalAddress = TextEditingController();
  final accidentDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar('सवारी दुर्घटना दर्ता'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextfield(
                    controller: complaintName,
                    label: 'उजुरिकार्ताको नाम',
                    validator: (val) => validateIsEmpty(string: val),
                    icon: Icons.person),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: complaintMobileNumber,
                    label: 'उजुरिकार्ताको नम्बर',
                    icon: Icons.phone),
                customButton('मिती चन्नुहोस्', () {
                  homeController.selectDate(context);
                }),
                Obx(() => Text(
                      DateFormat('yyyy-MM-dd')
                          .format(homeController.selectedDate.value),
                      textAlign: TextAlign.left,
                    )),
                Text(
                  'ठकर दिने सवारिसादनको विवरण',
                  style: subtitleStyle.copyWith(color: AppColor.red),
                ),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: hittingVehicleType,
                    label: 'सावारिको किसिम',
                    icon: Icons.car_crash),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: hittingVehicleColor,
                    label: 'रग',
                    icon: Icons.color_lens),

                // buildDropdown('सावारिको किसिम'),
                // buildDropdown('रग'),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: hittingVehicleNumber,
                    label: 'ठकर दिने सावारिको नम्बर',
                    icon: Icons.numbers_outlined),
                Text(
                  'ठकर खाने सवारिसादनको विवरण',
                  style: subtitleStyle.copyWith(color: AppColor.red),
                ),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: hittedVehicleType,
                    label: 'सावारिको किसिम',
                    icon: Icons.car_crash),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: hittedVehicleColor,
                    label: 'सावारिको रग',
                    icon: Icons.color_lens),

                // buildDropdown('सावारिको किसिम'),
                // buildDropdown('रग'),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: hittedVehicleNumber,
                    label: 'ठकर खाने सवारिसादनको नम्बर',
                    icon: Icons.numbers_outlined),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: accidentalAddress,
                    label: 'घटना घटेको स्थान',
                    icon: Icons.location_pin),
                CustomTextfield(
                    validator: (val) => validateIsEmpty(string: val),
                    controller: accidentDescription,
                    label: 'घटनाको विवरण',
                    icon: Icons.notes_rounded),
                customButton('फोटो चन्नुहोस्', () {}),
                const SizedBox(
                  height: 10,
                ),
                customButton('दर्ता गर्नुहोस्', () {
                  if (_formKey.currentState!.validate()) {
                    controller.postVehicleAccidentRegistration(
                      complaintName.text,
                      complaintMobileNumber.text,
                      homeController.selectedDate.value,
                      hittingVehicleType.text,
                      hittingVehicleColor.text,
                      hittingVehicleNumber.text,
                      hittedVehicleType.text,
                      hittedVehicleColor.text,
                      hittedVehicleNumber.text,
                      accidentalAddress.text,
                      accidentDescription.text,
                    );
                  } else {
                    getSnackbar(bgColor: AppColor.red, message: 'दर्ता असफल');
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
