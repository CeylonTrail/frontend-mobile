import 'package:get/get.dart';
import '../models/place_model.dart';
import '../models/trip_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TripController extends GetxController {
  var destination = ''.obs;
  var dayCount = 0.obs;
  var description = ''.obs;
  var places = <Place>[].obs;
  var selectedEvents = <Event>[].obs;

  Future<void> fetchNearbyPlaces(String location) async {
    final url = Uri.parse('http://10.22.162.199:8083/api/v1/traveller/places?location=$location');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      places.value = data.map((placeJson) => Place.fromJson(placeJson)).toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch nearby locations');
    }
  }

  void addEvent(int dayNum, Place place) {
    selectedEvents.add(Event(description: 'Event for ${place.name}', dayNum: dayNum, place: place));
  }

  void removeEvent(Place place) {
    selectedEvents.removeWhere((event) => event.place.placeId == place.placeId);
  }

  Future<void> saveTrip() async {
    final trip = Trip(
      destination: destination.value,
      dayCount: dayCount.value,
      description: description.value,
      eventSet: selectedEvents,
    );

    final url = Uri.parse('http://10.22.162.199:8083/api/v1/traveller/plan-trip');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(trip.toJson()));

    if (response.statusCode == 201) {
      Get.snackbar('Success', 'Trip saved successfully');
    } else {
      Get.snackbar('Error', 'Failed to save the trip');
    }
  }
}
