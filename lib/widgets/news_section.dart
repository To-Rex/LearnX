import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../screens/detailes/news_section_detail.dart';
import '../services/news_service.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final NewsService _newsService = NewsService();
  List<NewsModel> _allNews = [];
  List<NewsModel> _visibleNews = [];
  bool _isLoading = true;
  int _loadedCount = 0;
  final int _pageSize = 4;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    final news = await _newsService.getNews();
    if (!mounted) return;

    setState(() {
      _allNews = news;
      _loadedCount = news.length >= _pageSize ? _pageSize : news.length;
      _visibleNews = _allNews.take(_loadedCount).toList();
      _isLoading = false;
    });
  }

  void _loadMore() {
    setState(() {
      final remaining = _allNews.length - _loadedCount;
      final nextBatch = remaining >= _pageSize ? _pageSize : remaining;

      _loadedCount += nextBatch;
      _visibleNews = _allNews.take(_loadedCount).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final cardWidth = isMobile
        ? screenWidth * 0.9
        : (screenWidth - (isTablet ? 48 : 96)) / (isTablet ? 2 : 3);
    final maxCardWidth = cardWidth > 350 ? 350.0 : cardWidth;

    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 16 : 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Yangiliklar',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          if (_isLoading)
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            )
          else if (_allNews.isEmpty)
            Text(
              'Yangiliklar topilmadi.',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                color: Colors.grey[600],
              ),
            )
          else
            Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: isMobile ? 12 : 16,
                      runSpacing: isMobile ? 12 : 16,
                      alignment: WrapAlignment.start,
                      children: _visibleNews.map((article) {
                        return SizedBox(
                          width: maxCardWidth,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => NewsSectionDetail(news: article),
                                ),
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: Card(
                                elevation: 6,
                                shadowColor: Colors.grey.withOpacity(0.15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    article.imageUrl.isNotEmpty
                                        ? ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        article.imageUrl,
                                        height: isMobile ? 140 : 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => _buildPlaceholder(isMobile),
                                      ),
                                    )
                                        : _buildPlaceholder(isMobile),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article.title,
                                            style: TextStyle(
                                              fontSize: isMobile ? 15 : 17,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            article.shortText,
                                            style: TextStyle(
                                              fontSize: isMobile ? 13 : 14,
                                              color: Colors.grey[600],
                                              height: 1.4,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            '${article.date.toLocal()}'.split(' ')[0],
                                            style: TextStyle(
                                              fontSize: isMobile ? 12 : 13,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 24),
                if (_loadedCount < _allNews.length)
                  ElevatedButton(
                    onPressed: _loadMore,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 28,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Yana ko‘rish',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(bool isMobile) {
    return Container(
      height: isMobile ? 140 : 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade100, Colors.blueGrey.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.article,
          size: 50,
          color: Colors.white70,
        ),
      ),
    );
  }
}