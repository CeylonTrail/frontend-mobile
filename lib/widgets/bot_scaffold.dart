import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/chat_bot_model.dart';
import 'bot_chat.dart';

class BotScaffold extends StatefulWidget {
  final Widget body;
  final int? currentIndex;
  final Widget? bottomNavBar;

  const BotScaffold({
    required this.body,
    this.currentIndex,
    this.bottomNavBar,
    super.key,
  });

  @override
  BotScaffoldState createState() => BotScaffoldState();
}

class BotScaffoldState extends State<BotScaffold> {
  late double _fabX;
  late double _fabY;
  late double screenWidth;
  late double screenHeight;
  bool _isChatVisible = false;
  final TextEditingController _messageController = TextEditingController();
  final List<BotMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _fabX = 0;
    _fabY = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      _fabX = screenWidth - 80;
      _fabY = screenHeight - 160;
    });
  }

  void _toggleChatVisibility() {
    setState(() {
      _isChatVisible = !_isChatVisible;
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(BotMessage(
          text: _messageController.text,
          isUserMessage: true,
          timestamp: DateTime.now(),
        ));
        _messageController.clear();
        // Optionally, you could also handle automatic replies here if needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.body,
          if (_isChatVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: BotChat(
                messageController: _messageController,
                onSend: _sendMessage,
                onClose: _toggleChatVisibility,
                messages: _messages, // Pass the list of BotMessage
              ),
            ),
          if (!_isChatVisible)
            Positioned(
              left: _fabX,
              top: _fabY,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _fabX += details.delta.dx;
                    _fabY += details.delta.dy;
                  });
                },
                child: FloatingActionButton(
                  onPressed: _toggleChatVisibility,
                  child: SvgPicture.asset('assets/icons/bxs-bot.svg'),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavBar,
    );
  }
}
