import 'package:flutter/material.dart';

class LiveChatPanel extends StatelessWidget {
  const LiveChatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: isMobile ? width * 0.9 : 360,
        height: 460,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: const [
                  Icon(Icons.support_agent, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Yordam kerakmi?",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            // Chat body
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: const [
                  _ChatBubble(text: "Assalomu alaykum, sizga qanday yordam bera olamiz?", isBot: true),
                  _ChatBubble(text: "Men dasturlar haqida bilmoqchiman", isBot: false),
                  _ChatBubble(text: "Albatta! Siz qaysi davlatga qiziqyapsiz?", isBot: true),
                ],
              ),
            ),

            // Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Xabaringizni yozing...",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: Colors.blueAccent),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isBot;

  const _ChatBubble({required this.text, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isBot ? Colors.grey[200] : Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
