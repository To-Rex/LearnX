import 'package:flutter/material.dart';
import 'live_chat_panel.dart';

class LiveChatButton extends StatefulWidget {
  const LiveChatButton({super.key});

  @override
  State<LiveChatButton> createState() => _LiveChatButtonState();
}

class _LiveChatButtonState extends State<LiveChatButton> with SingleTickerProviderStateMixin {
  bool _isChatOpen = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleChat() {
    setState(() {
      _isChatOpen = !_isChatOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_isChatOpen)
          const Positioned(
            bottom: 90,
            right: 20,
            child: LiveChatPanel(),
          ),
        Positioned(
          bottom: 24,
          right: 24,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FloatingActionButton.extended(
              onPressed: toggleChat,
              backgroundColor: Colors.blueAccent,
              icon: Icon(_isChatOpen ? Icons.close : Icons.chat_bubble_outline, color: Colors.white),
              label: Text(_isChatOpen ? "Yopish" : "Live Chat", style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
