import 'package:get/get.dart';
import 'dart:async';

class OTPController extends GetxController {
  var showTimer = false.obs;
  var remainingTime = 60.obs; // 1 minute 30 seconds

  Timer? _timer;

  void startTimer() {
    showTimer.value = true;
    remainingTime.value = 60;

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        showTimer.value = false;
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
