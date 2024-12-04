import 'package:get/get.dart';

class TripPlanController extends GetxController {
  var isOnSecondPage = false.obs;
  var destinationName = ''.obs;
  var numberOfDays = 0.obs;
  var selectedDay = 1.obs;
  var isLoading = true.obs; // Loader state

  void loadPlacesWithDelay() async {
    isLoading.value = true; // Show loader
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    isLoading.value = false; // Hide loader after delay
  }

  // Map to keep track of places added for each day
  var addedPlaces = <int, List<String>>{}.obs;
  var remainingPlaces = ['9 Arch Bridge', 'Ella Rock', 'Flying Ravana', 'Ravana Ella', 'Little Adams Peak', 'Ravana Cave'].obs;

  // Map for place name to image path
  var placeImages = {
    '9 Arch Bridge': 'assets/images/9_arch_bridge.jpg',
    'Ella Rock': 'assets/images/ella_rock.jpg',
    'Flying Ravana': 'assets/images/flying_ravana.jpg',
    'Ravana Ella': 'assets/images/ravana_ella.jpg',
    'Little Adams Peak': 'assets/images/little_adams_peak.jpg',
    'Ravana Cave': 'assets/images/ravana_cave.jpg',
  };

  void goToNextPage(String destination, int days) {
    isOnSecondPage.value = true;
    destinationName.value = destination;
    numberOfDays.value = days;
    print("Updated number of days in controller: $numberOfDays");
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

  void reset() {
    isOnSecondPage.value = false;
    destinationName.value = '';
    numberOfDays.value = 0;
    selectedDay.value = 1;
    addedPlaces.clear();
    remainingPlaces.value = [
      '9 Arch Bridge', 'Ella Rock', 'Flying Ravana', 'Ravana Ella', 'Little Adams Peak', 'Ravana Cave'
    ];
  }
}
