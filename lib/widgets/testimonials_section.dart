import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 130, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFEEF2FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Muvaffaqiyat hikoyalari',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Bizning dasturlar orqali hayotini o‘zgartirganlar bilan tanishing.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = _getCardWidth(constraints.maxWidth);
              double cardHeight = 300;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _buildCard(
                    name: 'Aisha Karimova',
                    program: 'AQSh Dasturi 2023',
                    testimonial:
                    'AQSh dasturi hayotimni o\'zgartirdi! Ajoyib tajriba, ingliz tili va yangi do‘stlar. WorkTravel har qadamda yonimda bo‘ldi.',
                    initials: 'A',
                    color: Colors.blue,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                  _buildCard(
                    name: 'Dilshod Rahimov',
                    program: 'Yevropa Dasturi 2022',
                    testimonial:
                    'Germaniyada ishlash katta imkoniyatlar eshigini ochdi. Ishonchim oshdi, global fikrlashga o‘rgandim.',
                    initials: 'D',
                    color: Colors.orange,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                  _buildCard(
                    name: 'Sevara Tosheva',
                    program: 'Maxsus Dastur 2023',
                    testimonial:
                    'Jarayon juda silliq o‘tdi. Har bir bosqichda qo‘llab-quvvatlashni his qildim. Tavsiya qilaman!',
                    initials: 'S',
                    color: Colors.green,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  double _getCardWidth(double maxWidth) {
    if (maxWidth >= 1024) return 320;
    if (maxWidth >= 768) return (maxWidth - 64) / 2;
    return maxWidth - 32;
  }

  Widget _buildCard({
    required String name,
    required String program,
    required String testimonial,
    required String initials,
    required Color color,
    required double width,
    required double height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 6,
        shadowColor: color.withOpacity(0.15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Yulduzchalar
              Row(
                children: List.generate(
                  5,
                      (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  '"$testimonial"',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: color,
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        program,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
