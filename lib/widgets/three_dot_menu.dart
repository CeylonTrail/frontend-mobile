import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_theme.dart';

class ThreeDotMenu extends StatelessWidget {
  const ThreeDotMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPopup(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: AppTheme.colors.secondary_light_1,
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/bx-dots-vertical-rounded.svg'),
        ),
      ),
    );
  }
}

void _showPopup(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.colors.secondary_light_1,
          contentPadding: EdgeInsets.zero,
          content: Container(
            alignment: Alignment.center,
            width: 20,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 0),
                  child: ListTile(
                    title: Text(
                      'Block',
                      style: TextStyle(
                        color: AppTheme.colors.primary_dark_3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    splashColor: AppTheme.colors.secondary_light_1,
                    onTap: () {
                      Navigator.pop(context);
                      // Handle Option 1
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 0),
                  child: ListTile(
                    title: Text(
                      'Report',
                      style: TextStyle(
                        color: AppTheme.colors.warning_light,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    splashColor: AppTheme.colors.secondary_light_1,
                    onTap: () {
                      Navigator.pop(context);
                      // Handle Option 2
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
