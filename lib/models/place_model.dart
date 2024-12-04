class Place {
  final String placeId;
  final String name;
  final double latitude;
  final double longitude;
  final String description;
  final String photoUrl;
  final double rating;

  Place({
    required this.placeId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.photoUrl,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      placeId: json['placeId'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      description: json['description'] ?? 'No description',
      photoUrl: json['photoUrl'],
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }
}
