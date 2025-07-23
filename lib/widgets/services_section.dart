import 'package:flutter/material.dart';

import '../screens/detailes/visa_detail.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 600 ? 60 : 80, horizontal: screenWidth < 600 ? 16 : 32),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const Text('Mashhur yo\'nalishlar va dasturlar', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black87), textAlign: TextAlign.center),
              const SizedBox(height: 16),
              const Text(
                'Dunyo bo\'ylab ish va sayohat imkoniyatlarining ehtiyotkorlik bilan tanlangan to\'plamidan tanlang.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              isWide
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildServiceCard(
                    context,
                    'Chet Elga O\'qish',
                    'Xorijiy universitetlarga joylashish va o\'qish uchun yordam dasturlari.',
                    Icons.school,
                    Colors.teal,
                    [
                      'Universitet tanlash',
                      'Hujjatlar topshirish',
                      'Stipendiya maslahatlari',
                    ],
                  )),
                  const SizedBox(width: 24),
                  Expanded(child: _buildServiceCard(
                    context,
                    'Work and Travel',
                    'Chet elda ishlash va sayohat qilish imkoniyatini taqdim etuvchi dasturlar.',
                    Icons.work,
                    Colors.deepOrangeAccent,
                    [
                      'Ish joylashuvi',
                      'Turar joy yordami',
                      'Madaniy almashinuv',
                    ],
                  )),
                  const SizedBox(width: 24),
                  Expanded(child: _buildServiceCard(
                    context,
                    'Viza Yordami',
                    'Turli mamlakatlar uchun viza olish jarayonida professional yordam va maslahatlar.',
                    Icons.description,
                    Colors.blueAccent,
                    [
                      'Hujjatlar tayyorlash',
                      'Elchixona bilan aloqa',
                      'Viza turi bo\'yicha maslahat',
                    ],
                  )),
                ],
              )
                  : Column(
                children: [
                  _buildServiceCard(
                    context,
                    'Chet Elga O\'qish',
                    'Xorijiy universitetlarga joylashish va o\'qish uchun yordam dasturlari.',
                    Icons.school,
                    Colors.teal,
                    [
                      'Universitet tanlash',
                      'Hujjatlar topshirish',
                      'Stipendiya maslahatlari',
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildServiceCard(
                    context,
                    'Work and Travel',
                    'Chet elda ishlash va sayohat qilish imkoniyatini taqdim etuvchi dasturlar.',
                    Icons.work,
                    Colors.deepOrangeAccent,
                    [
                      'Ish joylashuvi',
                      'Turar joy yordami',
                      'Madaniy almashinuv',
                    ],
                  ),

                  const SizedBox(height: 24),
                  _buildServiceCard(
                    context,
                    'Viza Yordami',
                    'Turli mamlakatlar uchun viza olish jarayonida professional yordam va maslahatlar.',
                    Icons.description,
                    Colors.blueAccent,
                    [
                      'Hujjatlar tayyorlash',
                      'Elchixona bilan aloqa',
                      'Viza turi bo\'yicha maslahat',
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildServiceCard(context, String title, String description, IconData icon, Color color, List<String> features) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          //VisaDetail
          Navigator.pushNamed(context, '/visa-detail', arguments: {'title': title});
        },
        child:  Container(
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(maxWidth: 400, minWidth: 300, minHeight: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                      icon,
                      size: 28, color: color
                  )
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              ...features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 16, color: Colors.green),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        feature,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        )
      ),
    );
  }
}