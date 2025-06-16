import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Sayohatingizni boshlashga tayyormisiz?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Dasturlarimiz haqida ko\'proq ma\'lumot olish va xalqaro sarguzashtingizga birinchi qadamni qo\'yish uchun bugun biz bilan bog\'laning.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          LayoutBuilder(
            builder: (context, constraints) {
              final children = [
                _buildContactCard(
                  icon: Icons.phone,
                  title: 'Qo\'ng\'iroq qiling',
                  subtitle: 'Maslahatchilarimiz bilan gaplashing',
                  info: '+998 90 123 45 67',
                ),
                _buildContactCard(
                  icon: Icons.email,
                  title: 'Email yuboring',
                  subtitle: 'Batafsil ma\'lumot oling',
                  info: 'info@worktravel.uz',
                ),
                _buildContactCard(
                  icon: Icons.location_on,
                  title: 'Bizni ziyorat qiling',
                  subtitle: 'Shaxsan uchrashing',
                  info: 'Toshkent, O\'zbekiston\nAmir Temur ko\'chasi 108',
                ),
              ];

              if (constraints.maxWidth > 768) {
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < children.length; i++) ...[
                        Expanded(child: children[i]),
                        if (i != children.length - 1)
                          const SizedBox(width: 24),
                      ],
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    for (var i = 0; i < children.length; i++) ...[
                      children[i],
                      if (i != children.length - 1)
                        const SizedBox(height: 24),
                    ],
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 48),

          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 8,
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              'Bepul maslahat olish',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String info,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: Colors.white),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            info,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
