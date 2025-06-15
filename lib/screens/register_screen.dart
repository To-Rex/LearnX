import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService();

  DateTime? _birthDate;
  String? _gender;
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() => _birthDate = picked);
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate() && _birthDate != null && _gender != null) {
      setState(() => _isLoading = true);
      try {
        await _authService.signUp(context, _emailController.text.trim(), _passwordController.text.trim(), _nameController.text.trim(), birthDate: _birthDate!, gender: _gender!);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ro‘yxatdan o‘tishda xatolik: ${e.toString()}')),
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Iltimos, barcha maydonlarni to‘ldiring')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth < 300
              ? constraints.maxWidth * 0.95
              : constraints.maxWidth > 500
              ? 400
              : constraints.maxWidth * 0.9;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEBF4FF), Color(0xFFDBEAFE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.flight_takeoff, size: 60, color: Colors.blueAccent),
                          const SizedBox(height: 16),
                          Text('WorkTravel', style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('Ro‘yxatdan o‘ting', style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54)),
                          const SizedBox(height: 24),

                          // To‘liq ism
                          CustomTextField(
                            controller: _nameController,
                            label: 'To‘liq ism',
                            validator: (value) => value == null || value.isEmpty ? 'Ismingizni kiriting' : null,
                          ),
                          const SizedBox(height: 16),

                          // Email
                          CustomTextField(
                            controller: _emailController,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Email kiriting';
                              if (!value.contains('@')) return 'To‘g‘ri email kiriting';
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Parol
                          CustomTextField(
                            controller: _passwordController,
                            label: 'Parol',
                            obscureText: true,
                            validator: (value) => value == null || value.length < 6
                                ? 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak'
                                : null,
                          ),
                          const SizedBox(height: 16),

                          // Parolni tasdiqlash
                          CustomTextField(
                            controller: _confirmPasswordController,
                            label: 'Parolni tasdiqlang',
                            obscureText: true,
                            validator: (value) => value != _passwordController.text ? 'Parollar mos kelmaydi' : null,
                          ),
                          const SizedBox(height: 16),

                          // Tug‘ilgan sana
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _birthDate == null
                                    ? 'Tug‘ilgan sana'
                                    : '${_birthDate!.day}.${_birthDate!.month}.${_birthDate!.year}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _birthDate == null ? Colors.grey : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Jins tanlash
                          DropdownButtonFormField<String>(
                            value: _gender,
                            items: const [
                              DropdownMenuItem(value: 'male', child: Text('Erkak')),
                              DropdownMenuItem(value: 'female', child: Text('Ayol')),
                            ],
                            onChanged: (value) => setState(() => _gender = value),
                            decoration: InputDecoration(
                              labelText: 'Jins',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) => value == null ? 'Jinsni tanlang' : null,
                          ),

                          const SizedBox(height: 24),
                          CustomButton(
                            text: 'Ro‘yxatdan o‘tish',
                            onPressed: _isLoading ? null : _register,
                            isLoading: _isLoading,
                          ),
                          const SizedBox(height: 16),

                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/login'),
                            child: const Text('Hisobingiz bormi? Kiring'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
