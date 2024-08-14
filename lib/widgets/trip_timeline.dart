import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TripTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final bool completed; // New property to indicate if the destination is completed
  final String placeName;

  const TripTimeline({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.placeName,
    this.completed = false, // Default to not completed
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 40,
            child: TimelineTile(
              isFirst: isFirst,
              isLast: isLast,
              beforeLineStyle: LineStyle(
                color: completed
                    ? Colors.green
                    : Colors.grey, // Green if completed, grey otherwise
              ),
              afterLineStyle: LineStyle(
                color: completed
                    ? Colors.green
                    : Colors.grey, // Green if completed, grey otherwise
              ),
              indicatorStyle: IndicatorStyle(
                color: completed
                    ? Colors.green
                    : Colors.grey, // Green if completed, grey otherwise
              ),
              alignment: TimelineAlign.start,
            ),
          ),
          // const SizedBox(width: 10),
          Expanded(
            child: Text(
              placeName,
              style: TextStyle(
                color: completed
                    ? Colors.green
                    : Colors.black, // Green text if completed, black otherwise
                fontWeight: completed
                    ? FontWeight.bold
                    : FontWeight.normal, // Bold if completed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
