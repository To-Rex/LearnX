import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Foydalanuvchini ro‘yxatdan o‘tkazish
  Future<void> signUp(
      BuildContext context,
      String email,
      String password,
      String fullName, {required DateTime birthDate, required String gender}) async {

    final authResponse = await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'birth_date': birthDate.toIso8601String(),
          'gender': gender,
          'email': email,
        });
    final user = authResponse.user;
    if (user == null) {
      print("Foydalanuvchi ro'yxatdan o'ta olmadi.");
      throw Exception("Foydalanuvchi ro'yxatdan o'ta olmadi.");
    }

    print("Foydalanuvchi ro'yxatdan o'tildi.");
    Navigator.pushReplacementNamed(context, '/');
  }

  /// Foydalanuvchini tizimga kiritish
  Future<void> signIn(String email, String password) async {
    /*final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      print("Tizimga kirishda xatolik.");
      throw Exception("Tizimga kirishda xatolik.");
    }*/
    try {
      await _client.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      print("Tizimga kirishda xatolik.");
      throw Exception("Tizimga kirishda xatolik.");
    }
  }

  /// Foydalanuvchini tizimdan chiqarish
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Joriy foydalanuvchini olish (null bo‘lishi mumkin)
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  /// Foydalanuvchi profilini olish
  Future<Map<String, dynamic>?> getCurrentUserProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    final response = await _client
        .from('profiles')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    return response;
  }
}
