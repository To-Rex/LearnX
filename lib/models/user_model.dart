class UserModel {
  final String id;
  final String name;
  final String email;
  final DateTime birthDate;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'birthDate': birthDate.toIso8601String(),
      'gender': gender
    };
  }
}