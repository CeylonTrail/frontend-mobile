import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/recommended_trip_plan_model.dart';
import '../theme/app_theme.dart';

class TripPlanCard extends StatelessWidget {
  final RecommendedTripPlan plan;
  final VoidCallback onTap;

  const TripPlanCard({super.key, required this.plan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppTheme.colors.secondary_light_1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: '${plan.title}-${plan.imageUrls.first}',
                child: plan.imageUrls.first.startsWith('http')
                    ? CachedNetworkImage(
                  imageUrl: plan.imageUrls.first,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
                    : Image.asset(
                  plan.imageUrls.first,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                plan.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Text(
                'Days - ${plan.days}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppTheme.colors.primary_light_1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
