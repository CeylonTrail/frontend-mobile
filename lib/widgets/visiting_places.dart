import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_theme.dart';

class VisitingPlaces extends StatelessWidget {
  const VisitingPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 200,
              height: 25,
              child: Text(
                '9 Arch Bridge',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.colors.secondary_light_3,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 125,
                width: 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/9_arch_bridge.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 10),
          child: Container(
            height: 125,
            width: 60,
            decoration: BoxDecoration(
                color: AppTheme.colors.secondary_light_1,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))
            ),
            child: GestureDetector(
              onTap: (){
                // method
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme
                            .colors.secondary_light_3),
                  ),
                  SvgPicture.asset(
                    'assets/icons/bxs-plus-circle-grey.svg',
                    width: 35,
                    height: 35,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
