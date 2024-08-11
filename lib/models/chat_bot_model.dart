class BotMessage {
  final String text;
  final bool isUserMessage; // true for user, false for bot

  BotMessage({
    required this.text,
    required this.isUserMessage,
  });
}
