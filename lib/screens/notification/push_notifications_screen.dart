import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/model/push_notification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/widget/custom_tile.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:intl/intl.dart';

import 'notification_details.dart';

class PushNotificationScreen extends StatefulWidget {
  PushNotificationScreen({Key? key}) : super(key: key);

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  late final HomeController controller = Get.put(HomeController());
  late final AppController appCon = Get.put(AppController());
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final _getStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    init();
  }

  void init() async {
    try {
      await controller.pushNotification();
      getUnseenNotificationCount();
    } catch (e) {
      print('Error initializing push notifications: $e');
    }
  }

  void markAsSeen(int notificationId) {
    _getStorage.write('push_seen_$notificationId', true);
  }

  bool isNotificationSeen(int notificationId) {
    return _getStorage.read('push_seen_$notificationId') ?? false;
  }

  getUnseenNotificationCount() {
    controller.pushNotificationCount.value = controller.pushNotificationList
        .where((notification) => !isNotificationSeen(notification.id!))
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Obx(() {
        if (controller.pushNotificationList.isEmpty) {
          return buildEmptyNotificationScreen();
        } else {
          return buildNotificationList();
        }
      }),
    );
  }

  Widget buildEmptyNotificationScreen() {
    return const Center(
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationList() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.pushNotificationList.length,
      itemBuilder: (context, index) {
        final notification = controller.pushNotificationList[index];
        return GestureDetector(
          onTap: () {
            final notificationId = notification.id;
            if (!isNotificationSeen(notificationId!)) {
              markAsSeen(notificationId);
            }
            Get.to(NotificationDetailScreen(
              pushNotification: controller.pushNotificationList[index],
              type: 'push',
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNotificationContainer(notification),
              const Divider()
            ],
          ),
        );
      },
    );
  }

  Widget buildNotificationContainer(PushNotificationData notification) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appCon.isNepali.value
                ? decodeHtmlData(notification.title!.np.toString())
                : decodeHtmlData(notification.title!.en.toString()),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
          ),
          SizedBox(height: 8.0),
          Text(
            appCon.isNepali.value
                ? decodeHtmlData(notification.description!.np.toString())
                : decodeHtmlData(notification.description!.en.toString()),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          notification.files != null
              ? notification.files!.endsWith(".pdf")
                  ? Icon(
                      Icons.picture_as_pdf_outlined,
                      color: Colors.red,
                      size: 30,
                    )
                  : Image.network(
                      notification.files.toString(),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
              : const SizedBox(),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  notification.published == null
                      ? const Text("")
                      : Text(
                          formatDateString(notification.published.toString()),
                          style: const TextStyle(
                            fontStyle: FontStyle.normal,
                          )),
                  Text(" | "),
                  Text(
                    formatTimeString(notification.time.toString()),
                    style: const TextStyle(
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                "SEE DETAILS >",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryClr,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDateString(String inputDate) {
    // Parse the input string to DateTime
    DateTime date = DateTime.parse(inputDate);

    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy').format(date);

    return formattedDate;
  }

  String formatTimeString(String inputTime) {
    // Parse the input string to TimeOfDay
    List<String> timeParts = inputTime.split(':');
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    // Format the time
    String formattedTime = DateFormat.jm().format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timeOfDay.hour,
      timeOfDay.minute,
    ));

    return formattedTime;
  }

  static String decodeHtmlData(String? encodedData) {
    if (encodedData != null) {
      var dom = htmlParser.parse(encodedData);
      return dom.body!.text;
    }
    return '';
  }
}
