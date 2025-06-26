class PartnerModel {
  final int id;
  final String? name;
  final String? photo;
  final String? location;
  final String? cauntry;
  final DateTime createdAt;

  PartnerModel({
    required this.id,
    this.name,
    this.photo,
    this.location,
    this.cauntry,
    required this.createdAt,
  });

  factory PartnerModel.fromMap(Map<String, dynamic> map) {
    return PartnerModel(
      id: map['id'],
      name: map['name'],
      photo: map['photo'],
      location: map['location'],
      cauntry: map['cauntry'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'location': location,
      'cauntry': cauntry,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
