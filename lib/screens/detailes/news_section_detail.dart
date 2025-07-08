import 'package:flutter/material.dart';
import '../../models/news_model.dart';

class NewsSectionDetail extends StatelessWidget {
  final NewsModel news;

  const NewsSectionDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    final contentPadding = EdgeInsets.symmetric(
      horizontal: isMobile ? 16 : isTablet ? 32 : 64,
      vertical: 24,
    );

    final titleStyle = TextStyle(
      fontSize: isMobile ? 22 : isTablet ? 26 : 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      color: Colors.black87,
    );

    final dateStyle = TextStyle(
      fontSize: isMobile ? 13 : 15,
      color: Colors.grey[600],
      fontStyle: FontStyle.italic,
    );

    final bodyStyle = TextStyle(
      fontSize: isMobile ? 15 : 16,
      height: 1.7,
      color: Colors.black87,
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(
          'Yangilik',
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          news.imageUrl.isNotEmpty
              ? ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6)),
            child: Image.network(
              news.imageUrl,
              width: double.infinity,
              height: isMobile ? 220 : isTablet ? 300 : 400,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _buildPlaceholder(isMobile, isTablet),
            ),
          )
              : _buildPlaceholder(isMobile, isTablet),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: contentPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.title, style: titleStyle),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text('${news.date.toLocal()}'.split(' ')[0], style: dateStyle),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(height: 16),
                    Text(news.fullText, style: bodyStyle),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 32,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: Text(
                  'Orqaga',
                  style: TextStyle(
                    fontSize: isMobile ? 15 : 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 14 : 16,
                  ),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isMobile, bool isTablet) {
    return Container(
      height: isMobile ? 220 : isTablet ? 300 : 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6)),
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade100, Colors.blueGrey.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.article,
          size: 60,
          color: Colors.white70,
        ),
      ),
    );
  }
}