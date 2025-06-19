import 'package:flutter/material.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  final List<Map<String, String>> faqList = [
    {
      'question': 'Dasturga kimlar qatnasha oladi?',
      'answer':
      '18 yoshdan oshgan, pasporti va sog‘ligi joyida bo‘lgan har bir fuqaro qatnasha oladi.',
    },
    {
      'question': 'Til bilish majburimi?',
      'answer':
      'Ba’zi dasturlar uchun ingliz yoki boshqa chet tillarini bilish talab etiladi, lekin hammasi emas.',
    },
    {
      'question': 'Ish haqi qanday bo‘ladi?',
      'answer':
      'Har bir mamlakat va dasturga qarab ish haqi farq qiladi, lekin odatda 800 – 2000 yevro oralig‘ida.',
    },
    {
      'question': 'Vizani olishda yordam berasizmi?',
      'answer':
      'Albatta! Biz sizga hujjatlar tayyorlashdan tortib elchixona intervyusigacha to‘liq yordam beramiz.',
    },
    {
      'question': 'Qanday kafolatlar bor?',
      'answer':
      'Biz bilan ishlagan minglab mijozlar tajribasiga tayangan holda sizga ishonchli xizmatni taklif qilamiz.',
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF1F5FE), Color(0xFFDEEAFE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Tez-tez So‘raladigan Savollar',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              ...faqList.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isExpanded = _expandedIndex == index;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 20),
                      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _expandedIndex = expanded ? index : null;
                        });
                      },
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                      collapsedShape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                      leading: AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: isExpanded ? 0.25 : 0,
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.blueAccent,
                          size: 28,
                        ),
                      ),
                      title: Text(
                        item['question']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      children: [
                        Text(
                          item['answer']!,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
