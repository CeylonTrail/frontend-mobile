import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../theme/app_theme.dart';

class BotChat extends StatefulWidget {
  final TextEditingController messageController;
  final VoidCallback onSend;
  final VoidCallback onClose;
  final List<String> messages;

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
        widget.messages.add(widget.messageController.text);
        widget.onSend();
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
      Future.delayed(
          const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
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
              color: AppTheme.colors.white
            ),
          ),
        ),
        backgroundColor: AppTheme.colors.primary,
        // elevation: 4.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: SvgPicture.asset(('assets/icons/bx-minus.svg')),
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
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppTheme.colors.primary.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      child: Text(
                        widget.messages[widget.messages.length - 1 - index],
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.white
                        ),
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
                                    color: AppTheme.colors.primary.withOpacity(0.6)
                                )
                            ),
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
                            onPressed: widget.onSend,
                            // color: AppTheme.colors.white,
                            iconSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_scrollToBottom);
    _focusNode.dispose();
    super.dispose();
  }
}
