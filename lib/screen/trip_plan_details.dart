import 'package:ceylontrailapp/models/recommended_trip_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TripPlanDetailsPage extends StatefulWidget {
  final RecommendedTripPlan item;

  const TripPlanDetailsPage({super.key, required this.item});

  @override
  TripPlanDetailsPageState createState() =>
      TripPlanDetailsPageState();
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
        backgroundColor: Colors.white, // Set the AppBar background to white
        elevation: 2, // Adds a subtle shadow to the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Customize the back button icon
          color: Colors.black, // Set the back button color to black
          onPressed: () =>
              Navigator.of(context).pop(), // Go back to the previous screen
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
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
                      child: CachedNetworkImage(
                        imageUrl: widget.item.imageUrls[index],
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 16.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  widget.item.location,
                  style: TextStyle(fontSize: 20.0, color: Colors.green),
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
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement navigation to chat or messaging screen here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "Message Seller",
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
