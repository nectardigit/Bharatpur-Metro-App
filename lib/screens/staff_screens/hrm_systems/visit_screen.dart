import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:intl/intl.dart';

class VisitScreen extends StatelessWidget {
  VisitScreen({Key? key}) : super(key: key);
  final hrmcontroller = Get.put(HrmController());

  dateParse(formattedString) {
    DateTime date = DateTime.parse(formattedString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchVisit();
    return Scaffold(
      // appBar: buildAppbar('Visit list'),
      body: Obx(
        () => hrmcontroller.leaveList.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const BouncingScrollPhysics(),
                itemCount: hrmcontroller.visitList.length,
                itemBuilder: (context, index) {
                  var data = hrmcontroller.visitList[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(bottom: 20),
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("काज प्रकार: ${hrmcontroller.visitList[index].visitTypeName}"),
                          Text("काज क्षेत्र: ${hrmcontroller.visitList[index].visitArea}"),
                          Text("जम्मा दिन: ${hrmcontroller.visitList[index].totalDays}"),
                        ],
                      ),
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
