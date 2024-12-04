import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController controller = Get.put(BottomNavBarController());
    return ColoredBox(
      color: AppTheme.colors.white,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 14, top: 10),
        decoration: BoxDecoration(
          color: AppTheme.colors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => controller.changeIndex(0),
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 0
                      ? 'assets/icons/bxs-home.svg'
                      : 'assets/icons/bx-home.svg',
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => controller.changeIndex(1),
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 1
                      ? 'assets/icons/bxs-news.svg'
                      : 'assets/icons/bx-news.svg',
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => controller.changeIndex(2),
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 2
                      ? 'assets/icons/bxs-store-alt.svg'
                      : 'assets/icons/bx-store-alt.svg',
                ),
              ),
              // const SizedBox(width: 10),
              // IconButton(
              //   onPressed: () => controller.changeIndex(3),
              //   icon: SvgPicture.asset(
              //     controller.selectedIndex.value == 3
              //         ? 'assets/icons/bxs-user-voice.svg'
              //         : 'assets/icons/bx-user-voice.svg',
              //   ),
              // ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () => controller.changeIndex(4),
                icon: SvgPicture.asset(
                  controller.selectedIndex.value == 4
                      ? 'assets/icons/bxs-phone.svg'
                      : 'assets/icons/bx-phone.svg',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
