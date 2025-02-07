import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class LeavesScreen extends StatelessWidget {
  LeavesScreen({Key? key}) : super(key: key);
  final hrmcontroller = Get.put(HrmController());

  dateParse(formattedString) {
    DateTime date = DateTime.parse(formattedString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchLeave();
    return Scaffold(
      // appBar: buildAppbar('Leaves list'),
      body: Obx(
        () => hrmcontroller.leaveList.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const BouncingScrollPhysics(),
                itemCount: hrmcontroller.leaveList.length,
                itemBuilder: (context, index) {
                  var data = hrmcontroller.leaveList[index];
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
                      title: Text(hrmcontroller.leaveList[index].leaveTypeName
                          .toString()),
                      subtitle: Text(
                          "From: ${dateParse(data.dateFrom)}  To: ${dateParse(data.dateTo)}"),
                      trailing: Text(
                        data.approvedStatus == 0 ? 'Pending' : 'Approved',
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
