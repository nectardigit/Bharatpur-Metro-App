import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/appcontroller.dart';
import 'package:gandakimun/controllers/home_controller.dart';
import 'package:gandakimun/screens/splash_screen/splash_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.box.write('isViewed', true);
    return Scaffold(
        backgroundColor: AppColor.primaryClr,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(() => SplashScreen());
                  },
                  child: const Text('स्किप',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              TextButton(
                  onPressed: () {
                    Get.to(() => IntroScreen2());
                  },
                  child: const Text('अर्को',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ],
          ),
        ),
        body: _buildIntroTile());
  }

  _buildIntroTile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('सबै विवरण एकैठाउमा',
              style: titleStyle.copyWith(color: Colors.white)),
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.primaryClr,
              child: Icon(
                Icons.insert_chart_outlined_outlined,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: Text(
                'गण्डकी गाउँपालिकाको सबै विवरणहरुको जानकारी एकैठौम पाउनुहोस्',
                textAlign: TextAlign.center,
                style: subtitleStyle.copyWith(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}

class IntroScreen2 extends StatelessWidget {
  IntroScreen2({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryClr,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(() => SplashScreen());
                  },
                  child: const Text('स्किप',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              TextButton(
                  onPressed: () {
                    Get.to(() => IntroScreen3());
                  },
                  child: const Text('अर्को',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('समस्या तथा सुझाब दर्ता गर्नुहोस् ',
                  style: titleStyle.copyWith(color: Colors.white)),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.primaryClr,
                  child: Icon(
                    Icons.note_alt_outlined,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('गण्डकी गाउँपालिकाको सबै समस्या तथा सुझाब जानकारी दिनुहोस्',
                  style: subtitleStyle.copyWith(
                      color: Colors.white, fontSize: 15)),
            ],
          ),
        ));
  }
}

class IntroScreen3 extends StatelessWidget {
  IntroScreen3({Key? key}) : super(key: key);
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryClr,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(() => SplashScreen());
                  },
                  child: const Text('स्किप',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
              TextButton(
                  onPressed: () {
                    Get.to(() => SplashScreen());
                  },
                  child: const Text('अर्को',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('जरुरी नम्बरहरु',
                  style: titleStyle.copyWith(color: Colors.white)),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.primaryClr,
                  child: Icon(
                    Icons.phone_missed_outlined,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('जरुरी नम्बरहरु एकै ठाउमा पाउनुहोस्',
                  style: subtitleStyle.copyWith(
                      color: Colors.white, fontSize: 15)),
            ],
          ),
        ));
  }
}
