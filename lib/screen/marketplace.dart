import 'package:flutter/material.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Marketplace"),
    );
  }
}
