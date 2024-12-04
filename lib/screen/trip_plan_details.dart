import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ceylontrailapp/models/recommended_trip_plan_model.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:get/get.dart';

class TripPlanDetailsPage extends StatefulWidget {
  final RecommendedTripPlan item;

  const TripPlanDetailsPage({super.key, required this.item});

  @override
  TripPlanDetailsPageState createState() => TripPlanDetailsPageState();
}

class TripPlanDetailsPageState extends State<TripPlanDetailsPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // PageView for displaying images
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.item.imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: widget.item.imageUrls[index],
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: widget.item.imageUrls[index].startsWith('http')
                            ? CachedNetworkImage(
                          imageUrl: widget.item.imageUrls[index],
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        )
                            : Image.asset(
                          widget.item.imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Page indicator
                Positioned(
                  bottom: 16.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      "${_currentPage + 1}/${widget.item.imageUrls.length}",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Description section
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Location: ${widget.item.location ?? 'Unknown Location'}",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.item.description ?? 'No description available.',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Show a loading indicator for 1 second before showing the Snackbar
                      await Future.delayed(Duration(seconds: 1));

                      // Show Snackbar message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(backgroundColor: Colors.green,
                          content: Text('Trip saved successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      // Navigate to HomeScreen after showing the Snackbar
                      Get.to(HomeScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.colors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
