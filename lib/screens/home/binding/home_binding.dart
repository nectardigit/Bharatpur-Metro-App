import 'package:get/get.dart';
import 'package:gandakimun/screens/home/controller.dart/homeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
  }
}
