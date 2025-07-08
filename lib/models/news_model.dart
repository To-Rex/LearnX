class NewsModel {
  final String id;
  final String title;
  final String shortText;
  final String fullText;
  final DateTime date;
  final String imageUrl;

  NewsModel({
    required this.id,
    required this.title,
    required this.shortText,
    required this.fullText,
    required this.date,
    required this.imageUrl,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] as String,
      title: map['title'] as String,
      shortText: map['short_text'] as String? ?? '',
      fullText: map['full_text'] as String? ?? '',
      date: DateTime.parse(map['date']),
      imageUrl: map['image_url'] as String? ?? '',
    );
  }
}
