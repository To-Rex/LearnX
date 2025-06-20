class SectionItem {
  final String id;
  final String sectionId;
  final String title;
  final String description;
  final String imageUrl;

  SectionItem({
    required this.id,
    required this.sectionId,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory SectionItem.fromJson(Map<String, dynamic> json) => SectionItem(
    id: json['id'],
    sectionId: json['section_id'],
    title: json['title'],
    description: json['description'] ?? '',
    imageUrl: json['image_url'] ?? '',
  );
}
