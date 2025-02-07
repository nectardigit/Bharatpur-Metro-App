import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/widget/appbar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final hrmcontroller = Get.put(HrmController());

  @override
  Widget build(BuildContext context) {
    hrmcontroller.fetchProfile();
    return Scaffold(
      appBar: buildAppbar('Profile'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 20, color: Colors.black12, offset: Offset(0, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: subtitleStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Employee Number',
                  style: subtitleStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Office',
                  style: subtitleStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hrmcontroller.userProfile.value.name.toString(),
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(hrmcontroller.userProfile.value.employeeNo.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        hrmcontroller.fetchProfile();
                      },
                      child: Text(
                          hrmcontroller.userProfile.value.office.toString())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
