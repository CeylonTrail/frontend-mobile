import 'package:ceylontrailapp/models/place_model.dart';

class Trip {
  String destination;
  int dayCount;
  String description;
  List<Event> eventSet;

  Trip({
    required this.destination,
    required this.dayCount,
    required this.description,
    required this.eventSet,
  });

  Map<String, dynamic> toJson() {
    return {
      "destination": destination,
      "dayCount": dayCount,
      "description": description,
      "eventSet": eventSet.map((e) => e.toJson()).toList(),
    };
  }
}

class Event {
  String description;
  int dayNum;
  Place place;

  Event({
    required this.description,
    required this.dayNum,
    required this.place,
  });

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "dayNum": dayNum,
      "place": place,
    };
  }
}
