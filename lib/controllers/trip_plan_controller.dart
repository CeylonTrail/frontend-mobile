import 'package:get/get.dart';

class TripPlanController extends GetxController {
  var isOnSecondPage = false.obs;
  var destinationName = ''.obs;

  void goToNextPage(String destination) {
    isOnSecondPage.value = true;
    destinationName.value = destination;
  }
}
