import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authService = AuthService();
  UserModel? _user;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final user = await _authService.getCurrentUserProfile();
      debugPrint('Loaded user: $user');
      setState(() {
        _user = user;
      });
    } catch (e) {
      debugPrint('Error loading user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Shaxsiy Kabinet'),
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: _user == null
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF2C3E50)))
          : LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth > 600 ? constraints.maxWidth * 0.25 : 24, vertical: 30),
              child: Column(
                children: [
                  // Profil kartasi
                  _buildProfileCard(context, constraints),
                  const SizedBox(height: 30),
                  // Tahrirlash tugmasi
                  _buildEditButton(context, constraints)
                ]
              )
            )
          );
        }
      )
    );
  }

  Widget _buildProfileCard(BuildContext context, BoxConstraints constraints) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        width: constraints.maxWidth > 600 ? 400 : constraints.maxWidth * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 5, blurRadius: 10, offset: const Offset(0, 3))]
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Profil rasmi (placeholder)
              CircleAvatar(radius: 50, backgroundColor: const Color(0xFF2C3E50), child: Text(_user!.name.isNotEmpty ? _user!.name[0].toUpperCase() : 'U', style: const TextStyle(fontSize: 40, color: Colors.white))),
              const SizedBox(height: 20),
              Text(
                _user!.name,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF2C3E50)),
                textAlign: TextAlign.center
              ),
              const SizedBox(height: 10),
              _buildInfoRow(context, 'Email', _user!.email, Icons.email),
              const SizedBox(height: 10),
              _buildInfoRow(context, 'Tug‘ilgan Sana', _user!.birthDate, Icons.cake),
              const SizedBox(height: 10),
              _buildInfoRow(context, 'Jinsi', _user!.gender == 'male' ? 'Erkak' : 'Ayol', Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF2C3E50), size: 20),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2C3E50), fontSize: 14)),
              Text(
                value,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                overflow: TextOverflow.ellipsis
              )
            ]
          )
        )
      ]
    );
  }

  Widget _buildEditButton(BuildContext context, BoxConstraints constraints) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: constraints.maxWidth > 600 ? 300 : constraints.maxWidth * 0.7,
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/edit-profile'),
          style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2C3E50),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: _isHovered ? 8 : 4,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit, size: 18),
            SizedBox(width: 8),
            Text('Tahrirlash', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
          ]
        )
      )
    ));
  }
}