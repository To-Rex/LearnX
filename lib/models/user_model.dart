class UserModel {
  final String id;
  final String email;
  final String name;
  final String birthDate;
  final String gender;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.birthDate,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['full_name'],
      birthDate: json['birth_date'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': name,
      'birth_date': birthDate,
      'gender': gender,
    };
  }

  @override
  String toString() {
    return 'UserModel{id: $id, email: $email, name: $name, birthDate: $birthDate, gender: $gender}';
  }


}
