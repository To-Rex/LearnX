import 'package:flutter/material.dart';

class TrustSection extends StatelessWidget {
  const TrustSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bizga qanday ishonish mumkin?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                '“Work and Travel” sizning ishonchingizni oqlash uchun barcha zarur hujjatlar, '
                    'sertifikatlar va ruxsatnomalarga ega. Bizga minglab mijozlar ishonib, muvaffaqiyatli tarzda '
                    'chet elda ishlash va tajriba orttirish imkoniyatiga ega bo‘lgan.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: const [
                  _TrustItem(
                    icon: Icons.verified_user,
                    title: '100% Ruxsatnoma',
                    subtitle: 'Biz barcha yuridik hujjatlarga egamiz',
                  ),
                  _TrustItem(
                    icon: Icons.people,
                    title: '5000+ Mijoz',
                    subtitle: 'Bizga ishonib, chet elda ishlaganlar soni',
                  ),
                  _TrustItem(
                    icon: Icons.stars,
                    title: 'Sertifikatlangan xizmat',
                    subtitle: 'Rasmiy sertifikat va kafolat asosida xizmat',
                  ),
                  _TrustItem(
                    icon: Icons.thumb_up,
                    title: 'Yuqori qoniqish',
                    subtitle: 'Foydalanuvchilarimizning 98% bizni tavsiya qiladi',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrustItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _TrustItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade50,
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
