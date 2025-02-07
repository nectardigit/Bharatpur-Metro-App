import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/screens/dashboard_navigator.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../firebase.dart';
import '../../model/notificatiob_model.dart';
import '../../model/push_notification.dart';
import '../notification/notification_details.dart';

class SplashScreen extends StatefulWidget {
  final navigatorKey = FirebaseMessagingProvider().navigatorKey;

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppController controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (message != null) {
        print("click data is ${message.data['datas']}");
        var decodedData = json.decode(message.data['datas'].toString());
        print("decoded data$decodedData");
        PushNotificationData? pushNotification;
        NotificationData? generalNotification;
        if (message.data["type"] == "push") {
          pushNotification = PushNotificationData.fromJson(decodedData[0]);
          Future.delayed(const Duration(milliseconds: 2000), () async {
            if (widget.navigatorKey.currentState != null) {
              widget.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) => NotificationDetailScreen(
                  type: 'push',
                  pushNotification: pushNotification,
                ),
              ));
            } else {
              print("Navigator key is null");
            }
          });
        } else {
          generalNotification = NotificationData.fromJson(decodedData[0]);
          Future.delayed(const Duration(milliseconds: 2000), () async {
            if (widget.navigatorKey.currentState != null) {
              widget.navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) => NotificationDetailScreen(
                  noticeHeadingModel: generalNotification,
                  type: 'general',
                ),
              ));
            } else {
              print("Navigator key is null");
            }
          });
        }
      } else {
        delay();
      }
    });
  }

  delay() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Get.off(const DashboardPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.splashLogo,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText('गण्डकी गाउँपालिका',
                    duration: const Duration(seconds: 3),
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600)),
              ],
              totalRepeatCount: 1,
              pause: const Duration(seconds: 2),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
      ),
    );
  }
}
