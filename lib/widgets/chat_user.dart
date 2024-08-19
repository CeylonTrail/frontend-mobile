import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/chat_screen.dart';
import '../theme/app_theme.dart';

class ChatUser extends StatelessWidget {
  const ChatUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ChatScreen());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: AppTheme.colors.primary_dark_3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Last Sent or received message',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.colors.primary_dark_3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
