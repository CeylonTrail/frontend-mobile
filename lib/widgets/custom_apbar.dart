import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1A8C6F), // Set the background color to match the image
      elevation: 0, // Remove the default shadow
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white, // Set the icon color to white for better contrast
        onPressed: () {
          // Handle back button press
        },
      ),
      title: Text(
        'Profile',
        style: TextStyle(
          color: Colors.white, // Set the text color to white for better contrast
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          color: Colors.white, // Set the icon color to white for better contrast
          onPressed: () {
            // Handle edit button press
          },
        ),
      ],
    );
  }
}
