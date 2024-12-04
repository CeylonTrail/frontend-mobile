import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/screen/other_profile_screen.dart';
import '../controllers/chat_controller.dart';
import '../theme/app_theme.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: 'back_icon',
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset('assets/icons/bx-arrow-back.svg'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const OtherProfileScreen(), arguments: {'heroTag': 'profile_name'});
                  },
                  child: Hero(
                    tag: 'profile_name',
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      child: Text(
                        'Thiran Sasanka',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40)
              ],
            ),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  controller: scrollController,
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatController.messages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: message.isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: message.isSent
                                  ? AppTheme.colors.primary
                                  : AppTheme.colors.secondary, // Different color for replies
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: size.width * 0.7,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (message.imageUrl != null)
                                    Image.network(message.imageUrl!),
                                  Text(
                                    message.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: message.isSent
                                          ? AppTheme.colors.white
                                          : AppTheme.colors.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "${message.timestamp.hour.toString().padLeft(2, '0')}:${message.timestamp.minute.toString().padLeft(2, '0')}",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: message.isSent
                                            ? AppTheme.colors.white
                                            : AppTheme.colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.photo, color: AppTheme.colors.primary),
                    onPressed: () {
                      // Implement photo sending
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onTap: () {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppTheme.colors.primary),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: AppTheme.colors.primary),
                    onPressed: () {
                      final text = messageController.text.trim();
                      if (text.isNotEmpty) {
                        chatController.addMessage(
                          text,
                          true,
                        );
                        messageController.clear();
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
