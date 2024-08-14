import 'package:get/get.dart';

class TripPlanController extends GetxController {
  var isOnSecondPage = false.obs;
  var destinationName = ''.obs;
  var numberOfDays = 0.obs;
  var selectedDay = 1.obs;

  // Map to keep track of places added for each day
  var addedPlaces = <int, List<String>>{}.obs;
  var remainingPlaces = ['Place 1', 'Place 2', 'Place 3', 'Place 4', 'Place 5', 'Place 6'].obs;

  void goToNextPage(String destination, int days) {
    isOnSecondPage.value = true;
    destinationName.value = destination;
    numberOfDays.value = days;
    print("Updated number of days in controller: $numberOfDays"); // Debug print
  }

  void selectDay(int day) {
    selectedDay.value = day;
  }

  void addPlaceToDay(String place) {
    if (!addedPlaces.containsKey(selectedDay.value)) {
      addedPlaces[selectedDay.value] = [];
    }
    addedPlaces[selectedDay.value]?.add(place);
    remainingPlaces.remove(place);
  }

  void removePlaceFromDay(String place) {
    addedPlaces[selectedDay.value]?.remove(place);
    if (addedPlaces[selectedDay.value]?.isEmpty ?? false) {
      addedPlaces.remove(selectedDay.value);
    }
    remainingPlaces.add(place);
  }

  // Method to reset all state variables
  void reset() {
    isOnSecondPage.value = false;
    destinationName.value = '';
    numberOfDays.value = 0;
    selectedDay.value = 1;
    addedPlaces.clear();
    remainingPlaces.value = ['Place 1', 'Place 2', 'Place 3', 'Place 4', 'Place 5', 'Place 6']; // Reset to initial state if needed
  }
}
