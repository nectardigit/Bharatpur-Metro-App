import 'package:flutter/material.dart';
import 'package:gandakimun/screens/dashboard_screens/notice_and_information/views/notice_page.dart';
import 'package:gandakimun/screens/home/home_screen.dart';
import 'package:gandakimun/screens/qr_scanner.dart';
import 'package:gandakimun/screens/scroll_controller.dart';
import 'package:gandakimun/screens/share.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constants.dart';
import '../controllers/hrmcontroller.dart';
import 'login/login_view.dart';
import 'notification/general_notifications_screen.dart';
import 'other/register_complaint_problem.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.put(BottomNavigationController());
  final hrmcon = Get.put(HrmController());
  int _currentIndex = 0;
  final List _screens = [
    const HomeScreen(),
    NoticePage(),
    const SamasyaDarta(),
    LoginView()
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _screens[_currentIndex],
        floatingActionButton: Obx(() => controller.isVisible.value
            ? Padding(
                padding: const EdgeInsets.all(1.0),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            Get.to(QRViewExample());
                          });
                        },
                        backgroundColor: AppColor.primaryClr,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.qr_code_scanner,
                              size: 30,
                            ),
                            // Text(
                            //   "Login",
                            //   style:
                            //       TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
                            // )
                          ],
                        )),
                  ),
                ),
              )
            : Wrap()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => controller.isVisible.value
              ? Wrap(
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                          ),
                      height: 60,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        child: BottomAppBar(
                          shape: const CircularNotchedRectangle(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Like button
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _currentIndex = 0;
                                        });
                                      },
                                      icon: Image.asset(
                                        AppIcons.homeIcons,
                                        width: 35,
                                        height: 35,
                                        color: _currentIndex == 0
                                            ? AppColor.primaryClr
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 1;
                                      });
                                    },
                                    icon: Icon(Icons.newspaper,
                                        size: 30,
                                        color: _currentIndex == 1
                                            ? AppColor.primaryClr
                                            : Colors.grey)),
                                SizedBox(width: 80),
                                // Dislike button
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 2;
                                      });
                                    },
                                    icon: Icon(Icons.how_to_vote,
                                        size: 30,
                                        color: _currentIndex == 2
                                            ? AppColor.primaryClr
                                            : Colors.grey)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = 3;
                                      });
                                    },
                                    icon: Icon(Icons.person_3,
                                        size: 30,
                                        color: _currentIndex == 3
                                            ? AppColor.primaryClr
                                            : Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Wrap(),
        ));
  }
}
