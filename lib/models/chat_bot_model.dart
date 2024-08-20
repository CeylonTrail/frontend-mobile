class BotMessage {
  final String text;
  final bool isUserMessage; // true for user, false for bot
  final DateTime timestamp; // Ensure this is non-nullable

  BotMessage({
    required this.text,
    required this.isUserMessage,
    required this.timestamp,
  });
}
