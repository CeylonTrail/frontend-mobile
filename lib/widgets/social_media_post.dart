import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/app_theme.dart';

class SocialMediaPost extends StatelessWidget {
  const SocialMediaPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/img.png',
              width: 42,
              height: 42,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => PostPopup(),
                );
              },
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write Something...",
                  hintStyle: TextStyle(
                    color: AppTheme.colors.secondary_light_3,
                  ),
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                enabled: false, // Disable TextField to trigger GestureDetector
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/bxs-photo-album.svg'),
        ],
      ),
    );
  }
}

class PostPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Create Post'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Write Something...",
                    hintStyle: TextStyle(
                      color: AppTheme.colors.secondary_light_3,
                    ),
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                // Add other widgets for the post popup here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
