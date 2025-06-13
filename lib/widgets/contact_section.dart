import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Sayohatingizni boshlashga tayyormisiz?',
            style: TextStyle(
              fontSize: 36,
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
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                return Row(
                  children: [
                    Expanded(child: _buildContactCard(
                      Icons.phone,
                      'Qo\'ng\'iroq qiling',
                      'Maslahatchilarimiz bilan gaplashing',
                      '+998 90 123 45 67',
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildContactCard(
                      Icons.email,
                      'Email yuboring',
                      'Batafsil ma\'lumot oling',
                      'info@worktravel.uz',
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildContactCard(
                      Icons.location_on,
                      'Bizni ziyorat qiling',
                      'Shaxsan uchrashing',
                      'Toshkent, O\'zbekiston\nAmir Temur ko\'chasi 108',
                    )),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildContactCard(
                      Icons.phone,
                      'Qo\'ng\'iroq qiling',
                      'Maslahatchilarimiz bilan gaplashing',
                      '+998 90 123 45 67',
                    ),
                    const SizedBox(height: 24),
                    _buildContactCard(
                      Icons.email,
                      'Email yuboring',
                      'Batafsil ma\'lumot oling',
                      'info@worktravel.uz',
                    ),
                    const SizedBox(height: 24),
                    _buildContactCard(
                      Icons.location_on,
                      'Bizni ziyorat qiling',
                      'Shaxsan uchrashing',
                      'Toshkent, O\'zbekiston\nAmir Temur ko\'chasi 108',
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Bepul maslahat olish',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String subtitle, String info) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: Colors.white,
          ),
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
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}