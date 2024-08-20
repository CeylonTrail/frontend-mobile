import 'dart:async';
import 'package:get/get.dart';

import '../models/chat_messages_model.dart';

class ChatController extends GetxController {
  var messages = <ChatMessages>[].obs;
  var replyToMessageId = Rx<String?>(null);  // To store the ID of the message being replied to

  void addMessage(String text, bool isSent, {String? imageUrl, String? repliedTo}) {
    messages.add(ChatMessages(
      text: text,
      isSent: isSent,
      timestamp: DateTime.now(),
      imageUrl: imageUrl,
      repliedTo: repliedTo,
    ));
    replyToMessageId.value = null;  // Reset reply ID after sending the message

    if (isSent) {
      // Schedule automatic reply after a delay
      Future.delayed(Duration(seconds: 1), () {
        messages.add(ChatMessages(
          text: "Automated reply to: $text",
          isSent: false,
          timestamp: DateTime.now(),
          repliedTo: text,  // Reply to the original message
        ));
      });
    }
  }

  void setReplyTo(String? messageId) {
    replyToMessageId.value = messageId;
  }
}
