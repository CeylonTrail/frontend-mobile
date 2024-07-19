import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class PreviousTrips extends StatelessWidget {
  const PreviousTrips({super.key});

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
                  "Previous Trips",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.colors.black,
                      fontWeight: FontWeight.w900),
                ),
                TextButton(
                  onPressed: () {},
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
                      child:
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/galle.jpg',
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
                                  "Galle",
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
                              'assets/images/galle.jpg',
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
                                  "Galle",
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
                              'assets/images/galle.jpg',
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
                                  "Galle",
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
                              'assets/images/galle.jpg',
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
                                  "Galle",
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
                              'assets/images/galle.jpg',
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
                                  "Galle",
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
