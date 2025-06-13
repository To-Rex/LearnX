import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Muvaffaqiyat hikoyalari',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Bizning dasturlarimiz orqali hayotlarini o\'zgartirgan talabalardan eshiting.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildTestimonialCard(
                      'Aisha Karimova',
                      'AQSh Dasturi 2023',
                      'AQSh dasturi hayotimni o\'zgartirdi! Men ajoyib ish tajribasi oldim, ingliz tilimni yaxshiladim va butun dunyodan do\'stlar orttirdim. WorkTravel har qadamda menga yordam berdi.',
                      'A',
                      Colors.blue,
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildTestimonialCard(
                      'Dilshod Rahimov',
                      'Yevropa Dasturi 2022',
                      'Germaniyada ishlash men hech qachon tasavvur qilmagan eshiklarni ochdi. Tajriba ishonchimni oshirdi va bugungi kunda martabamda yordam beradigan global nuqtai nazarni berdi.',
                      'D',
                      Colors.orange,
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildTestimonialCard(
                      'Sevara Tosheva',
                      'Maxsus Dastur 2023',
                      'Arizadan qaytishgacha jarayon silliq va professional edi. Men butun sayohatim davomida qo\'llab-quvvatlanganligimni his qildim. Sarguzasht izlayotgan har qanday talabaga tavsiya qilaman!',
                      'S',
                      Colors.green,
                    )),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildTestimonialCard(
                      'Aisha Karimova',
                      'AQSh Dasturi 2023',
                      'AQSh dasturi hayotimni o\'zgartirdi! Men ajoyib ish tajribasi oldim, ingliz tilimni yaxshiladim va butun dunyodan do\'stlar orttirdim. WorkTravel har qadamda menga yordam berdi.',
                      'A',
                      Colors.blue,
                    ),
                    const SizedBox(height: 24),
                    _buildTestimonialCard(
                      'Dilshod Rahimov',
                      'Yevropa Dasturi 2022',
                      'Germaniyada ishlash men hech qachon tasavvur qilmagan eshiklarni ochdi. Tajriba ishonchimni oshirdi va bugungi kunda martabamda yordam beradigan global nuqtai nazarni berdi.',
                      'D',
                      Colors.orange,
                    ),
                    const SizedBox(height: 24),
                    _buildTestimonialCard(
                      'Sevara Tosheva',
                      'Maxsus Dastur 2023',
                      'Arizadan qaytishgacha jarayon silliq va professional edi. Men butun sayohatim davomida qo\'llab-quvvatlanganligimni his qildim. Sarguzasht izlayotgan har qanday talabaga tavsiya qilaman!',
                      'S',
                      Colors.green,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String name, String program, String testimonial, String initial, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) => Icon(
                Icons.star,
                size: 20,
                color: Colors.amber,
              )),
            ),
            const SizedBox(height: 16),
            Text(
              '"$testimonial"',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      initial,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
            ),
          ],
        ),
      ),
    );
  }
}