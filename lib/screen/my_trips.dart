import 'package:ceylontrailapp/widgets/trip_start_button.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MyTrips extends StatelessWidget {
   MyTrips({super.key});

  // List of trips with different images, titles, and dates
  final List<Map<String, String>> trips = [
    {
      'image': 'assets/images/9_arch_bridge.jpg', // Image path for trip 1
      'title': 'Ella',
      'duration': '2 Days',
      'date': '2024/12/03',
    },

    {
      'image': 'assets/images/kandy_1.jpg', // Image path for trip 2
      'title': 'Kandy',
      'duration': '3 Days',
      'date': '2024/12/03',
    },

    // {
    //   'image': 'assets/images/anuradhpura_1.jpg', // Image path for trip 2
    //   'title': 'Anuradhapura',
    //   'duration': '3 Days',
    //   'date': '2024/12/03',
    // },


    // Add more trips as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.primary,
        title: const Text(
          "My Trips",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65, // Adjusted aspect ratio for better layout
              crossAxisSpacing: 10,
              mainAxisSpacing: 8.0,
            ),
            itemCount: trips.length, // Dynamically set the number of items based on the list
            itemBuilder: (context, index) {
              final trip = trips[index]; // Get the trip data for the current index
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3, // Allocate a portion of space for the image
                      child: Image.asset(
                        trip['image']!, // Use the image path from the trip data
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Expanded(
                      flex: 2, // Allocate a portion of space for text and background
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              trip['title']!, // Use the title from the trip data
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              trip['duration']!, // Use the duration from the trip data
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Created on: ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.colors.black,
                                  ),
                                ),
                                Text(
                                  trip['date']!, // Use the date from the trip data
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.colors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TripStartButton(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
