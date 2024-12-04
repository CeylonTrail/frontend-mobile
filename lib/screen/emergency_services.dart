import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

class EmergencyServices extends StatefulWidget {
  const EmergencyServices({super.key});

  @override
  State<EmergencyServices> createState() => _EmergencyState();
}

class _EmergencyState extends State<EmergencyServices> {
  // List of emergency services
  final List<Map<String, String>> emergencyNumbers = [
    {'title': 'Police Emergency Hotline 1', 'number': '118'},
    {'title': 'Police Emergency Hotline 2', 'number': '119'},
    {'title': 'Ambulance / Fire & Rescue', 'number': '110'},
    {'title': 'Accident Service - General Hospital Colombo', 'number': '011-2691111'},
    {'title': 'Tourist Police', 'number': '011-2421052'},
    {'title': 'Police Emergency', 'number': '011-2433333'},
    {'title': 'Government Information Center', 'number': '1919'},
    {'title': 'Report Crimes', 'number': '011-2691500'},
    {'title': 'Emergency Police Mobile Squad', 'number': '011-5717171'},
    {'title': 'Fire & Ambulance Service', 'number': '011-2422222'},
    {'title': 'Suwaseriya', 'number': '1990'},
  ];

  // Function to make a call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: emergencyNumbers.length,
        itemBuilder: (context, index) {
          final service = emergencyNumbers[index];
          return Card(
            color: AppTheme.colors.secondary_light_1,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                service['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(service['number']!),
              leading:  Icon(Icons.phone, color: AppTheme.colors.primary),
              onTap: () => _makePhoneCall(service['number']!),
            ),
          );
        },
      ),
    );
  }
}
