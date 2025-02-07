import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class StaffController extends GetxController {
  var selectedValue = ''.obs;
  var login = true.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> selectedDate2 = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  Rx<TimeOfDay> selectedTime2 = TimeOfDay.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColor.primaryClr, // <-- SEE HERE
                  onPrimary: AppColor.backgroundClr, // <-- SEE HERE
                  onSurface: Colors.grey.shade800, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primaryClr,
                  ),
                ),
              ),
              child: child!);
        });

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate2.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColor.primaryClr, // <-- SEE HERE
                  onPrimary: AppColor.backgroundClr, // <-- SEE HERE
                  onSurface: Colors.grey.shade800, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primaryClr,
                  ),
                ),
              ),
              child: child!);
        });

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != selectedDate2) {
      selectedDate2.value = picked;
    }
  }

  Rx<TimeOfDay> pick = TimeOfDay.now().obs;
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primaryClr, // <-- SEE HERE
              onPrimary: AppColor.backgroundClr, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.primaryClr,
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    );

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != selectedTime) {
      final localizations = MaterialLocalizations.of(context);
      selectedTime.value = picked;

      pick.value = picked;
    }
  }

  Rx<TimeOfDay> pick2 = TimeOfDay.now().obs;

  Future<void> selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime2.value,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primaryClr, // <-- SEE HERE
              onPrimary: AppColor.backgroundClr, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    );

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != selectedTime) {
      final localizations = MaterialLocalizations.of(context);
      selectedTime2.value = picked;

      pick2.value = picked;
    }
  }

  // //ApiRepos
  //  fetchLeaveType() async {
  //   var data = await HrmApi().leaveTypes(AppStorage.readAccessToken.toString());
  //   if (data != null) {
  //     data.forEach((v) => leaveTypeList.add(LeaveType.fromJson(v)));
  //   }
  // }
}
