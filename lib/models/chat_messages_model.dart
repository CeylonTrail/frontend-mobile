class ChatMessages {
  final String text;
  final bool isSent;
  final DateTime timestamp;
  final String? imageUrl;
  final String? repliedTo;  // ID or some identifier for the replied message

  ChatMessages({
    required this.text,
    required this.isSent,
    required this.timestamp,
    this.imageUrl,
    this.repliedTo,
  });
}
