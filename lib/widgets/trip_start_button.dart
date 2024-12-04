import 'package:ceylontrailapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

class TripStartButton extends StatefulWidget {
  const TripStartButton({super.key});

  @override
  State<TripStartButton> createState() => _TripStartButtonState();
}

class _TripStartButtonState extends State<TripStartButton> {
  // Button state: true = "Start", false = "Finish"
  bool isStart = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (isStart) {
          // Show snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Click on "Current Trip" to start your journey.'),
              duration: Duration(seconds: 3),
            ),
          );

          // Navigate to HomeScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );

          // Change button state
          setState(() {
            isStart = false;
          });
        } else {
          // When "Finish" is clicked, perform actions accordingly
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Your trip has finished!'),
              duration: Duration(seconds: 2),
            ),
          );

          // Reset button state or navigate back
          setState(() {
            isStart = true;
          });
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: isStart ? AppTheme.colors.primary : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: SizedBox(
        width: 80,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              isStart ? 'Start' : 'Finish',
              style: TextStyle(
                color: AppTheme.colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy HomeScreen to navigate to
