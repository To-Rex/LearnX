import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Biz Haqimizda',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              isMobile
                  ? Column(
                children: [
                  _buildImage(),
                  const SizedBox(height: 24),
                  _buildText(TextAlign.center),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildImage()),
                  const SizedBox(width: 30),
                  Expanded(child: _buildText(TextAlign.justify)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          'https://sun9-19.userapi.com/impf/c837433/v837433626/2ad90/cZ5eSQHpag8.jpg?size=604x442&quality=96&sign=dc39348b5909dd503e13c3e2e77c076f&type=album',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
          const Center(child: Icon(Icons.broken_image, size: 48))
        )
      )
    );
  }

  Widget _buildText(TextAlign align) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Biz kimmiz?',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12),
        Text(
          '“Work and Travel” jamoasi — xalqaro tajribaga ega, yoshlarga chet elda '
              'ishlash va sayohat qilish imkoniyatlarini yaratishda yetakchi bo‘lgan kompaniya. '
              'Biz har bir mijozimizga individual yondashamiz va ishonchli xizmatni kafolatlaymiz.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
