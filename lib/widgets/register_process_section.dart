import 'package:flutter/material.dart';

class RegisterProcessSection extends StatelessWidget {
  const RegisterProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'title': '1. Ariza topshiring',
        'description':
        'Saytdagi ro‘yxatdan o‘tish shaklini to‘ldiring va shaxsiy ma’lumotlaringizni yuboring.',
        'icon': Icons.edit_note,
      },
      {
        'title': '2. Profilingizni tasdiqlang',
        'description':
        'Email yoki telefon orqali yuborilgan tasdiqlovchi havolani tasdiqlang.',
        'icon': Icons.verified_user,
      },
      {
        'title': '3. Intervyu va tekshiruv',
        'description':
        'Biz siz bilan bog‘lanamiz va dasturga mosligingizni aniqlaymiz.',
        'icon': Icons.question_answer,
      },
      {
        'title': '4. Rasmiy ro‘yxatga olinadi',
        'description':
        'Siz rasmiy ishtirokchilar ro‘yxatiga kiritilasiz va keyingi bosqichlar boshlanadi.',
        'icon': Icons.how_to_reg,
      },
    ];

    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Dasturga Qanday Ro‘yxatdan O‘tiladi?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: steps.map((step) {
                  return SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.blue.shade50,
                          child: Icon(step['icon'] as IconData, size: 32, color: Colors.blue),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          step['title'] as String,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          step['description'] as String,
                          style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
