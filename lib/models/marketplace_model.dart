class MarketplaceItem {
  final String title;
  final String description;
  final String location;
  final List<String> images;  // List to store multiple image URLs
  final dynamic rate;
  final String rateType;
  final String createdAt; // Assuming date is a String, otherwise adjust accordingly

  MarketplaceItem({
    required this.title,
    required this.description,
    required this.location,
    required this.images,
    required this.rate,
    required this.rateType,
    required this.createdAt,
  });

  factory MarketplaceItem.fromJson(Map<String, dynamic> json) {
    return MarketplaceItem(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      images: List<String>.from(json['images'] ?? []), // Ensure imageUrls is a list
      rate: json['rate'] ?? 0.0,
      rateType: json['rateType'] ?? 'per day',  // Adjust if needed
      createdAt: json['createdAt'] ?? '', // Adjust if needed
    );
  }
}
