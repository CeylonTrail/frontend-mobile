import 'package:flutter/material.dart';

class EmergencyServices extends StatefulWidget {
  const EmergencyServices({super.key});

  @override
  State<EmergencyServices> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<EmergencyServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Emergency Servicec"),
    );
  }
}
