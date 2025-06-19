import 'package:flutter/material.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  final List<Map<String, String>> news = const [
    {
      'title': '2025-yil uchun yangi dasturlar ochildi!',
      'date': '13 Iyun 2025',
      'image':
      'https://images.unsplash.com/photo-1529070538774-1843cb3265df?auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Evropada ishlash uchun viza talablari soddalashtirildi',
      'date': '10 Iyun 2025',
      'image':
      'https://avatars.mds.yandex.net/i?id=a400664279e16ea3f65175c0aa0327cf_l-3597607-images-thumbs&n=13',
    },
    {
      'title': 'Work and Travel dasturiga qanday ro‘yxatdan o‘tiladi?',
      'date': '07 Iyun 2025',
      'image':
      'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Yangiliklar',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: news.map((article) {
              return SizedBox(
                width: isMobile ? double.infinity : 300,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        article['image']!,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              article['date']!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
