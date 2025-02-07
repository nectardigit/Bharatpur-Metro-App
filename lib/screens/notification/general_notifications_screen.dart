import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/widget/appbar.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:get_storage/get_storage.dart';

import '../home/home_screen.dart';
import 'notification_details.dart';

class GeneralNotificationScreen extends StatefulWidget {
  const GeneralNotificationScreen({Key? key}) : super(key: key);

  @override
  State<GeneralNotificationScreen> createState() =>
      _GeneralNotificationScreenState();
}

class _GeneralNotificationScreenState extends State<GeneralNotificationScreen> {
  final controller = Get.put(HomeController());
  final appCon = Get.put(AppController());
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final _getStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await controller.fetchNotification();
  }

  void markAsSeen(int notificationId) {
    _getStorage.write('seen_$notificationId', true);
  }

  bool isNotificationSeen(int notificationId) {
    return _getStorage.read('seen_$notificationId') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => controller.notificationList.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        size: 100,
                        color: AppColor.primaryClr,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Notifications Not Available',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.notificationList.length,
                        (index) => CustomTile(
                          ontap: () {
                            final notificationId =
                                controller.notificationList[index].id;
                            if (!isNotificationSeen(notificationId!)) {
                              markAsSeen(notificationId);
                            }
                            Get.to(NotificationDetailScreen(
                              noticeHeadingModel:
                                  controller.notificationList[index],
                              type: 'general',
                            ));
                          },
                          leading: CircleAvatar(
                            radius: 16,
                            backgroundColor: isNotificationSeen(
                                    controller.notificationList[index].id!)
                                ? Colors.green
                                : AppColor.red,
                            child: const Icon(
                              Icons.notifications,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          title: appCon.isNepali.value
                              ? controller.notificationList[index].title!.np
                                  .toString()
                              : controller.notificationList[index].title!.en
                                  .toString(),
                          subtitle:
                              "${controller.notificationList[index].published ?? ""}",
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
