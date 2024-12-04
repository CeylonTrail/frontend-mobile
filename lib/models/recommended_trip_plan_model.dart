class RecommendedTripPlan {
  final String title;
  final List<String> imageUrls;
  final String days;
  final String description;
  final String location;
  final List<double> coordinates;

  RecommendedTripPlan({
    required this.title,
    required this.imageUrls,
    required this.days,
    required this.description,
    required this.location,
    required this.coordinates,
  });
}
