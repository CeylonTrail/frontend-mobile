import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PopularDestinations extends StatelessWidget {
  const PopularDestinations({super.key});

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
                  "Popular Destinations",
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
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.colors.primary,
                        fontWeight: FontWeight.normal),
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
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/ambuluwawa.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ambuluwawa",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     // const SizedBox(width: 10),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/galle_fort.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Galle Fort",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     // const SizedBox(width: 10),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/sigiriya.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sigiriya",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     // const SizedBox(width: 10),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/anuradhapura.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Anuradhapura",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     // const SizedBox(width: 10),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/temple_of_tooth.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Temple of Tooth",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     // const SizedBox(width: 10),
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/marble-beach.jpg',
                              width: 180,
                              height: 240,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Marble Beach",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Row(
                                //   children: [
                                //     SvgPicture.asset(
                                //       'assets/icons/bxs-star-half.svg',
                                //       height: 20,
                                //       width: 20,
                                //     ),
                                //     // const SizedBox(width: 10),
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
