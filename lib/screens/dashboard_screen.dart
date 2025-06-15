import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _authService = AuthService();
  UserModel? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }



  Future<void> _loadUserData() async {
    final user = _authService.getCurrentUser();
    setState(() {
      _currentUser = user as UserModel?;
    });
  }


  Future<void> _logout() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _currentUser == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Xush kelibsiz, ${_currentUser!.name}!',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Email: ${_currentUser!.email}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Dasturlar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildProgramCard(
              'AQSh Dasturi',
              'J-1 viza bilan AQShda ishlash imkoniyati',
              Icons.flag,
              Colors.blue,
            ),
            const SizedBox(height: 12),
            _buildProgramCard(
              'Yevropa Dasturi',
              'Yevropa davlatlarida ishlash va sayohat',
              Icons.euro,
              Colors.orange,
            ),
            const SizedBox(height: 12),
            _buildProgramCard(
              'Maxsus Dasturlar',
              'Shaxsiy ehtiyojlaringizga moslashtirilgan',
              Icons.star,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramCard(String title, String description, IconData icon, Color color) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to program details
        },
      ),
    );
  }
}