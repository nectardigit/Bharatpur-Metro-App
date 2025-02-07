import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../constants.dart';

class FieldVisitScreen extends StatelessWidget {
  FieldVisitScreen({Key? key}) : super(key: key);
  final hrmcontroller = Get.put(HrmController());

  timeParse(formattedString) {
    DateTime date = DateTime.parse(formattedString);
    String formattedDate = DateFormat('hh:mm').format(date);

    return formattedDate;
  }

  dateParse(formattedString) {
    DateTime date = DateTime.parse(formattedString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchFieldVisit();
    return Scaffold(
      // appBar: buildAppbar('FieldVisit list'),
      body: Obx(
        () => hrmcontroller.leaveList.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const BouncingScrollPhysics(),
                itemCount: hrmcontroller.fieldvisitList.length,
                itemBuilder: (context, index) {
                  var data = hrmcontroller.fieldvisitList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(bottom: 20),
                    // padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 20,
                              color: Colors.black12,
                              offset: Offset(0, 2))
                        ]),
                    child: ListTile(
                      title: Text("Date: ${dateParse(data.fieldDate)}"),
                      subtitle: Text(
                          "Time from: ${timeParse(data.timeFrom)} Time to: ${timeParse(data.timeTo)}"),
                      trailing: Text(
                        data.approvedStatus == 0 || data.approvedStatus == null
                            ? 'Pending'
                            : 'Approved',
                        style:
                            subtitleStyle.copyWith(color: AppColor.primaryClr),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
