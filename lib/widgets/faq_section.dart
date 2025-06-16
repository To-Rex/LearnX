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

  List<bool> _expanded = [];

  @override
  void initState() {
    super.initState();
    _expanded = List.generate(faqList.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
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
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 20),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Icon(
                      _expanded[index] ? Icons.remove_circle : Icons.add_circle,
                      color: Colors.blue,
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
                    onExpansionChanged: (value) {
                      setState(() {
                        _expanded[index] = value;
                      });
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
