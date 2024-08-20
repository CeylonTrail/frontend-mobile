class MarketplaceItem {
  final String title;
  final List<String> imageUrls; // Change from single image to a list of images
  final String price;
  final String description;
  final String location;

  MarketplaceItem({
    required this.title,
    required this.imageUrls, // Update constructor
    required this.price,
    required this.description,
    required this.location,
  });
}
