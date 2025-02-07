import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/phones.dart';
import 'package:gandakimun/screens/dashboard_screens/urgent_contact_no_page/contact_detaills.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';

// ignore: must_be_immutable
class ContactFilterScreen extends StatelessWidget {
  ContactFilterScreen(
      {Key? key, required this.phone, required this.index, required this.text});
  Phones phone;
  int index;
  String text;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return Scaffold(
      appBar:
          buildAppbar(phone.data!.entries.map((e) => e.key).toList()[index]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: phone.data!.values.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = phone.data!.values.toList()[index];
                  List<PhoneData> filterdata =
                      data.where((e) => e.contGroup!.en == text).toList();
                  print(filterdata.length);
                  return ListView.builder(
                      itemCount: filterdata.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomTile(
                            ontap: () {
                              Get.to(ContactDetails(
                                phonesData: filterdata[index],
                              ));
                            },
                            title: controller.isNepali.value
                                ? filterdata[index].name!.np.toString()
                                : filterdata[index].name!.en.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
