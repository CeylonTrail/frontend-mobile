import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TripTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;

  const TripTimeline(
      {required this.isFirst,
      required this.isLast,
      required this.isPast,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: SizedBox(
        height: 60,
        width: 100,
        child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
        ),
      ),
    );
  }
}
