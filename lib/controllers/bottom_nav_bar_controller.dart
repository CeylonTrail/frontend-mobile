import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  void onBackButtonPressed() {
    // Set the index to 0 (home screen) when back button is pressed
    selectedIndex.value = 0;
  }
}
