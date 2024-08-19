class RecommendedTripPlan{
  final String title;
  final List<String> imageUrls; // Change from single image to a list of images
  final String days;
  final String description;
  final String location;

  RecommendedTripPlan({
    required this.title,
    required this.imageUrls, // Update constructor
    required this.days,
    required this.description,
    required this.location,
  });
}