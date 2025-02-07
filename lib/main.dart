import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gandakimun/screens/onboarding_screen/intro_screen.dart';
import 'package:gandakimun/screens/splash_screen/splash_screen.dart';
import 'package:gandakimun/widget/drawer.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingProvider().initialize();
  await FirebaseMessaging.instance.subscribeToTopic("gandakimun");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _checkForUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        const primaryColor = Color(0xff004e9e);
        return GetMaterialApp(
            title: 'Gandaki',
            debugShowCheckedModeBanner: false,
            navigatorKey: FirebaseMessagingProvider().navigatorKey,
            theme: ThemeData(
                useMaterial3: false,
                primarySwatch: MaterialColor(primaryColor.value, const {
                  50: Color.fromRGBO(4, 57, 92, .1),
                  100: Color.fromRGBO(4, 57, 92, .2),
                  200: Color.fromRGBO(4, 57, 92, .3),
                  300: Color.fromRGBO(4, 57, 92, .4),
                  400: Color.fromRGBO(4, 57, 92, .5),
                  500: Color.fromRGBO(4, 57, 92, .6),
                  600: Color.fromRGBO(4, 57, 92, .7),
                  700: Color.fromRGBO(4, 57, 92, .8),
                  800: Color.fromRGBO(4, 57, 92, .9),
                  900: Color.fromRGBO(4, 57, 92, 1),
                })),
            home: controller.box.read("isViewed") == true
                ? SplashScreen()
                : IntroScreen());
      },
    );
  }

  Future<void> _checkForUpdate() async {
    final appUpdateInfo = await InAppUpdate.checkForUpdate();
    if (appUpdateInfo.updateAvailability ==
        UpdateAvailability.updateAvailable) {
      await InAppUpdate.startFlexibleUpdate();
    }
  }
}
