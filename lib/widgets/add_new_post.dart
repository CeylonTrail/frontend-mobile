import 'package:ceylontrailapp/widgets/post_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/popup_route.dart';
import '../theme/app_theme.dart';

class AddNewPost extends StatelessWidget {
  const AddNewPost({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Container(
        height: 80,
        width: size.width - 20,
        decoration: BoxDecoration(
          color: AppTheme.colors.secondary_light_2,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppTheme.colors.primary, width: 2),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 1,
          //     blurRadius: 1,
          //     offset: const Offset(0, 5), // changes position of shadow
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.colors.primary,
                    width: 1.5
                  )
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/img.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(SlideFromTopRoute(page: const PostPopup()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppTheme.colors.primary,
                      width: 1)
                    ),
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Add a new post...",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/gallery-photos.svg',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {
                  // TODO: Add functionality to open gallery and select images
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
