import 'package:ceylontrailapp/widgets/added_places.dart';
import 'package:ceylontrailapp/widgets/visiting_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class TripScreen2 extends StatelessWidget {
  const TripScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                          'Places near ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppTheme.colors.primary_dark_3,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Ella',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppTheme.colors.secondary_dark_2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.colors.black,
                  thickness: 1,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        VisitingPlaces(),
                        VisitingPlaces(),
                        VisitingPlaces(),
                        VisitingPlaces(),


                      ],
                    ),
                  ),
                ),

                Divider(
                  color: AppTheme.colors.black,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Added places',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppTheme.colors.primary_dark_3,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.54,
                  width: double.infinity,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        AddedPlaces(),
                        AddedPlaces(),
                        AddedPlaces(),
                        AddedPlaces()

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
