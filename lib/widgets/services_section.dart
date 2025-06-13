import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 768;

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 600 ? 60 : 100, horizontal: screenWidth < 600 ? 16 : 32),
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
                    'Koreya Dasturlari',
                    'Amerika madaniyatini his qiling, AQSh bo\'ylab kurortlar, o\'yin-kulgi parklari va mehmondo\'stlik joylarida ishlang.',
                    Icons.flag,
                    Colors.blueAccent,
                    [
                      'J-1 Viza yordami',
                      '4 oylik dasturlar',
                      'Turar joy yordami',
                    ],
                  )),
                  const SizedBox(width: 24),
                  Expanded(child: _buildServiceCard(
                    'Yevropa Almashinuvi',
                    'Mehmondo\'stlik, turizm va mavsumiy ish imkoniyatlari orqali Yevropa madaniyatini kashf eting.',
                    Icons.language,
                    Colors.deepOrangeAccent,
                    [
                      'Yevropa Ittifoqi ish ruxsatlari',
                      '6 oylik dasturlar',
                      'Til o\'rgatish',
                    ],
                  )),
                  const SizedBox(width: 24),
                  Expanded(child: _buildServiceCard(
                    'Maxsus Dasturlar',
                    'Sizning aniq martaba maqsadlaringiz va qiziqishlaringizga moslashtirilgan ish va sayohat tajribalari.',
                    Icons.workspace_premium,
                    Colors.teal,
                    [
                      'Shaxsiy moslashtirish',
                      'Moslashuvchan davomiylik',
                      'Martaba rivojlantirish',
                    ],
                  )),
                ],
              )
                  : Column(
                children: [
                  _buildServiceCard(
                    'AQSh Dasturlari',
                    'Amerika madaniyatini his qiling, AQSh bo\'ylab kurortlar, o\'yin-kulgi parklari va mehmondo\'stlik joylarida ishlang.',
                    Icons.flag,
                    Colors.blueAccent,
                    [
                      'J-1 Viza yordami',
                      '4 oylik dasturlar',
                      'Turar joy yordami',
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildServiceCard(
                    'Yevropa Almashinuvi',
                    'Mehmondo\'stlik, turizm va mavsumiy ish imkoniyatlari orqali Yevropa madaniyatini kashf eting.',
                    Icons.language,
                    Colors.deepOrangeAccent,
                    [
                      'Yevropa Ittifoqi ish ruxsatlari',
                      '6 oylik dasturlar',
                      'Til o\'rgatish',
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildServiceCard(
                    'Maxsus Dasturlar',
                    'Sizning aniq martaba maqsadlaringiz va qiziqishlaringizga moslashtirilgan ish va sayohat tajribalari.',
                    Icons.workspace_premium,
                    Colors.teal,
                    [
                      'Shaxsiy moslashtirish',
                      'Moslashuvchan davomiylik',
                      'Martaba rivojlantirish',
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

  Widget _buildServiceCard(String title, String description, IconData icon, Color color, List<String> features) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
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
                size: 28,
                color: color,
              ),
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
            )).toList(),
          ],
        ),
      ),
    );
  }
}