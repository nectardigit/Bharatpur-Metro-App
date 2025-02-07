import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxBool isVisible = true.obs;

  void hide() {
    isVisible.value = false;
    print("isVisible ${isVisible.value}");
  }

  void show() {
    isVisible.value = true;
    print("isVisible ${isVisible.value}");
  }
}
