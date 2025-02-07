import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/fieldvisit_screen.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/leaves_screen.dart';
import 'package:gandakimun/screens/staff_screens/hrm_systems/visit_screen.dart';

class BidaKajChetraScreen extends StatelessWidget {
  const BidaKajChetraScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryClr,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                )),
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: AppColor.red,
                tabs: [
                  Tab(
                    text: 'बिदा सूची',
                  ),
                  Tab(
                    text: 'काज सूची',
                  ),
                  Tab(
                    text: 'क्षेत्र सूची',
                  ),
                ]),
          ),
          body: TabBarView(
              children: [LeavesScreen(), VisitScreen(), FieldVisitScreen()])),
    );
  }
}
