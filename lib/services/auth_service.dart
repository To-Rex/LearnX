import '../models/user_model.dart';

class AuthService {
  UserModel? _currentUser;

  Future<UserModel> signIn(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock authentication - replace with real API
    if (email.isNotEmpty && password.length >= 6) {
      _currentUser = UserModel(
        id: '1',
        name: 'Test User',
        email: email,
      );
      return _currentUser!;
    } else {
      throw Exception('Noto\'g\'ri email yoki parol');
    }
  }

  Future<UserModel> signUp(String email, String password, String name) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock registration - replace with real API
    _currentUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
    );
    return _currentUser!;
  }

  Future<void> signOut() async {
    _currentUser = null;
  }

  Future<UserModel?> getCurrentUser() async {
    return _currentUser;
  }

  bool get isLoggedIn => _currentUser != null;
}