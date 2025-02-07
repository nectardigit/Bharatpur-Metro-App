import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gandakimun/model/push_notification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gandakimun/helper/sql_helper.dart';
import 'package:gandakimun/widget/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../main.dart';
import '../model/notificatiob_model.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  final ImagePicker imgPicker = ImagePicker();
  var webviewLoading = true.obs;
  var yes = false.obs;
  var openDrawer = false.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var selectedFilePath = ''.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  var notificationList = <NotificationData>[].obs;
  var pushNotificationList = <PushNotificationData>[].obs;
  var pushNotificationCount = 0.obs;

  //  Rx<DateFormat> formatter = DateFormat('yyyy-MM-dd').obs;
  //  Rx<String> formatted = Date
  @override
  void onInit() {
    getNoti();
    super.onInit();
  }

  void getNoti() async {
    pushNotification();
    await fetchNotification();
    await getUnseenNotificationCount();
  }

  final getStorage = GetStorage();

  bool isNotificationSeen(int notificationId) {
    return getStorage.read('seen_$notificationId') ?? false;
  }

  getUnseenNotificationCount() {
    pushNotificationCount.value = notificationList
        .where((notification) => !isNotificationSeen(notification.id!))
        .length;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: AppColor.primaryClr)),
              child: child!);
        });

    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} Mb";
      // uploadImage(File(selectedImagePath.value));
    } else {
      getSnackbar(
        bgColor: AppColor.red,
        message: 'No image selected',
      );
    }
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      selectedFilePath.value = result.files.single.path.toString();
    } else {
      getSnackbar(
        bgColor: AppColor.red,
        message: 'No file selected',
      );
    }
  }

  pushNotification() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    String? deviceToken = await _firebaseMessaging.getToken();
    try {
      var data = await ApiService().getPushNotificationList(deviceToken);
      print("data is$data");
      pushNotificationList.clear();
      if (data != null) {
        data.forEach((v) {
          pushNotificationList.add(PushNotificationData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'notification error');
    }
  }

  fetchNotification() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    String? deviceToken = await _firebaseMessaging.getToken();

    try {
      var data = await ApiService().getNotificationServices(deviceToken);
      print("data is$data");
      notificationList.clear();
      if (data != null) {
        data.forEach((v) {
          notificationList.add(NotificationData.fromJson(v));
        });
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'notification error');
    }
  }

  // markAsSeenSend(notificationId) async {
  //   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  //   String? deviceToken = await firebaseMessaging.getToken();
  //   try {
  //     await ApiService().markAsSeen(deviceToken, notificationId);
  //   } on Exception catch (e) {
  //     log(e.toString(), name: 'notification error');
  //   }
  // }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> makeUrl(String url) async {
    if (!await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  late String token;

  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    log("fire token: $token");
  }
}
