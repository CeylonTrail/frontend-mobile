import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendedTripPlans extends StatelessWidget {
  const RecommendedTripPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recommended Trip Plans"),
                TextButton(onPressed: () {}, child: const Text("View All"),)
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Image.asset('assets/images/ella-9.jpg',
                  width: 240,
                  height:280,),
                  Row(
                    children: [Text("Ella"),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/bxs-star-half.svg'),
                        Text("4.7"),
                      ],
                    )],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
