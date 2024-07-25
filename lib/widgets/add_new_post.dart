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
          gradient: LinearGradient(
            colors: [AppTheme.colors.secondary, AppTheme.colors.primary_dark_3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppTheme.colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/img.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(SlideFromTopRoute(page: PostPopup()));
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: Text(
                      "Create a new post...",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppTheme.colors.white,
                        fontWeight: FontWeight.bold,
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
