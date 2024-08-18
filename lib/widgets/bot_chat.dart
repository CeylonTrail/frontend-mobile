import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import '../models/chat_bot_model.dart'; // Ensure this import is correct
import '../theme/app_theme.dart';
import 'dart:async'; // For handling the 10-second delay
import 'package:speech_to_text/speech_to_text.dart'; // Import SpeechToText package

class BotChat extends StatefulWidget {
  final TextEditingController messageController;
  final VoidCallback onSend;
  final VoidCallback onClose;
  final List<BotMessage> messages; // Accept List<BotMessage>

  const BotChat({
    required this.messageController,
    required this.onSend,
    required this.onClose,
    required this.messages,
    super.key,
  });

  @override
  BotChatState createState() => BotChatState();
}

class BotChatState extends State<BotChat> {
  late SpeechToText _speechToText;
  bool _speechEnabled = false;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _speechToText = SpeechToText();
    _initSpeech();
    _focusNode.addListener(_scrollToBottom);
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      if (widget.messageController.text.isNotEmpty) {
        _sendMessage(widget.messageController.text);
        widget.messageController.clear();
      }
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      widget.messageController.text = result.recognizedWords;
    });
  }

  void _scrollToBottom() {
    if (_focusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _sendMessage(String text) {
    final userMessage = BotMessage(
      text: text,
      isUserMessage: true,
      timestamp: DateTime.now(), // Ensure this is non-nullable
    );
    setState(() {
      widget.messages.add(userMessage);
    });
    _scrollToBottom();

    // Simulate automatic reply after a 10-second delay
    Future.delayed(const Duration(seconds: 10), () {
      final botReply = BotMessage(
        text: 'Received',
        isUserMessage: false,
        timestamp: DateTime.now(), // Ensure this is non-nullable
      );
      setState(() {
        widget.messages.add(botReply);
      });
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'TrailBot',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.colors.white,
            ),
          ),
        ),
        backgroundColor: AppTheme.colors.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: SvgPicture.asset('assets/icons/bx-minus.svg'),
              onPressed: widget.onClose,
            ),
          ),
        ],
      ),
      body: ColoredBox(
        color: AppTheme.colors.primary.withOpacity(0.3),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                itemCount: widget.messages.length,
                itemBuilder: (context, index) {
                  final message = widget.messages[widget.messages.length - 1 - index];
                  return Align(
                    alignment: message.isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: message.isUserMessage
                            ? AppTheme.colors.primary.withOpacity(0.8)
                            : AppTheme.colors.secondary,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message.text,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppTheme.colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _formatTimestamp(message.timestamp),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ColoredBox(
              color: AppTheme.colors.white,
              child: Column(
                children: [
                  Divider(
                    height: 2,
                    color: AppTheme.colors.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.colors.secondary_light_1.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: AppTheme.colors.primary.withOpacity(0.6))),
                            child: TextField(
                              maxLines: null,
                              minLines: 1,
                              focusNode: _focusNode,
                              controller: widget.messageController,
                              decoration: InputDecoration(
                                hintText: _speechToText.isListening
                                    ? 'Listening...'
                                    : 'Type your message...',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (_speechToText.isNotListening) {
                                      _startListening();
                                    } else {
                                      _stopListening();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      _speechToText.isNotListening
                                          ? 'assets/icons/bxs-microphone-off.svg'
                                          : 'assets/icons/bxs-microphone.svg',
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset('assets/icons/bxs-send.svg'),
                            onPressed: () {
                              if (widget.messageController.text.isNotEmpty) {
                                _sendMessage(widget.messageController.text);
                                widget.messageController.clear();
                              }
                            },
                            iconSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _focusNode.removeListener(_scrollToBottom);
    _focusNode.dispose();
    super.dispose();
  }
}
