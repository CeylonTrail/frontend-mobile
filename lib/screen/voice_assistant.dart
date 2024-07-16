import 'package:flutter/material.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({super.key});

  @override
  State<VoiceAssistant> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<VoiceAssistant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Voice Assistant"),
    );
  }
}
