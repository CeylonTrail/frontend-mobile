import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';  // Import the intl package
import '../models/marketplace_model.dart';
import '../theme/app_theme.dart';
import '../widgets/utils.dart';

class MarketplaceItemDetailPage extends StatefulWidget {
  final MarketplaceItem item;

  const MarketplaceItemDetailPage({super.key, required this.item});

  @override
  MarketplaceItemDetailPageState createState() =>
      MarketplaceItemDetailPageState();
}

class MarketplaceItemDetailPageState extends State<MarketplaceItemDetailPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  // Function to format date to only show the date (year, month, day)
  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      final formatter = DateFormat('yyyy-MM-dd'); // Format as yyyy-MM-dd
      return formatter.format(parsedDate);
    } catch (e) {
      return 'Unknown Date'; // Fallback if parsing fails
    }
  }

  // Function to display the rate with proper format
  String _getRateDisplay(dynamic rate, String rateType) {
    double rateValue = rate is double ? rate : double.tryParse(rate.toString()) ?? 0.0;

    if (rateType == 'per day') {
      return "\ Rs.$rateValue / Day";
    } else if (rateType == 'per week') {
      return "\ Rs.$rateValue / Week";
    } else if (rateType == 'per month') {
      return "\ Rs.$rateValue / Month";
    } else {
      return "\ Rs.$rateValue"; // For fixed price or other rates
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
      ),
      body: Column(
        children: [
          // Image carousel
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: item.images.isNotEmpty ? item.images.length : 1, // Ensure at least one item is shown
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                // Check if imageUrls is not empty and if it contains valid data
                final imageUrl = item.images.isNotEmpty
                    ? replaceLocalhostWithIP(item.images[0]) // Access the image URL
                    : 'assets/images/no_image.jpg'; // Fallback image if empty or invalid

                // Debugging: Print the URL to check its value
                print("Image URL: $imageUrl");

                return Hero(
                  tag: imageUrl, // Ensure the tag is unique
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 8),
                // Show the formatted date
                Text(
                  'Posted on: ${_formatDate(item.createdAt)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  'Price: ${_getRateDisplay(item.rate, item.rateType)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.green),
                ),
                const SizedBox(height: 16),
            TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                backgroundColor: AppTheme.colors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: SizedBox(
                width: 160,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bxs-chat.svg',
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Message Seller',
                      style: TextStyle(
                          color: AppTheme.colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600// Set the font size to 16
                      ),
                    ),
                  ],
                ),
              ),
            )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
