import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gandakimun/screens/notification/notification_details.dart';
import 'package:gandakimun/screens/notification/notification_screen.dart';
import 'package:gandakimun/widget/drawer.dart';

import 'model/notificatiob_model.dart';
import 'model/push_notification.dart';

class FirebaseMessagingProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  bool isFlutterLocalNotificationsInitialized = false;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/launcher_icon');

  static final FirebaseMessagingProvider _instance =
      FirebaseMessagingProvider._internal();

  factory FirebaseMessagingProvider() {
    return _instance;
  }

  FirebaseMessagingProvider._internal() {
    initialize();
  }

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _requestPermission();
    await _firebaseMessaging.getToken();
    FirebaseMessaging.onMessage.listen(_onMessageReceived);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  void _onMessageReceived(RemoteMessage message) {
    print('Received message foreground: ${message.notification!}');
    print('Foreground message data: ${message.data}');
    print('Data message: ${message.data}');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        print("yaxa her mula$payload");
        handleNotification(message);
      },
    );
    _initializeLocalNotifications();
    _showLocalNotification(message);
  }

  void _onMessageOpenedApp(RemoteMessage message) {
    print('Received message onMessageOpenedApp: ${message.notification!}');
    print('onMessageOpenedApp message data: ${message.data}');
    handleNotification(message);
  }

  void handleNotification(RemoteMessage message) {
    print("click data is ${message.data['datas']}");
    var decodedData = json.decode(message.data['datas'].toString());
    print("decoded data$decodedData");
    PushNotificationData? pushNotification;
    NotificationData? generalNotification;
    if (message.data["type"] == "push") {
      pushNotification = PushNotificationData.fromJson(decodedData[0]);
      Future.delayed(const Duration(milliseconds: 100), () async {
        if (navigatorKey.currentState != null) {
          navigatorKey.currentState?.push(MaterialPageRoute(
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
      Future.delayed(const Duration(milliseconds: 100), () async {
        if (navigatorKey.currentState != null) {
          navigatorKey.currentState?.push(MaterialPageRoute(
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
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    handleNotification(message);
    await _setupFlutterNotifications();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        handleNotification(message);
      },
    );
    print('Handling a background message ${message.messageId}');
  }

  Future<void> _setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> _initializeLocalNotifications() async {
    if (!isFlutterLocalNotificationsInitialized) {
      await _setupFlutterNotifications();
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
    );
  }
}
