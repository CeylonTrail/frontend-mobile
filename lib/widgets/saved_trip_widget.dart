import 'package:ceylontrailapp/screen/my_trips.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class SavedTripWidget extends StatelessWidget {
  const SavedTripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Trips",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.colors.black,
                      fontWeight: FontWeight.w900),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.white; // Change this to your desired color and opacity
                        }
                        return null; // Defer to the default overlay color
                      },
                    ),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Get.to( MyTrips());
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.colors.primary,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/kandy_1.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ella",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),


                                // const SizedBox(
                                //   width: 100,
                                // ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     const SizedBox(width: 10),
                                //     Text(
                                //       "4.7",
                                //       style: TextStyle(
                                //           fontSize: 14,
                                //           color: AppTheme.colors.black,
                                //           fontWeight: FontWeight.normal),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
