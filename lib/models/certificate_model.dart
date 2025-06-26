class CertificateModel {
  final int id;
  final String title;
  final String imageUrl;
  final DateTime createdAt;

  CertificateModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
  });

  factory CertificateModel.fromMap(Map<String, dynamic> map) {
    return CertificateModel(
      id: map['id'],
      title: map['title'],
      imageUrl: map['image_url'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
