class Section {
  final String id;
  final String name;
  final String slug;
  bool isVisible;

  Section({
    required this.id,
    required this.name,
    required this.slug,
    required this.isVisible,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'] as String,
      name: map['name'] as String,
      slug: map['slug'] as String,
      isVisible: map['is_visible'] as bool,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'slug': slug,
    'is_visible': isVisible,
  };
}