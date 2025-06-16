import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomNavigationBar extends StatelessWidget {
  final Function(String) onNavigate;

  const CustomNavigationBar({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 2))]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Row(
              children: const [
                Icon(Icons.flight_takeoff, size: 32, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'LearnX',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            // Navigation Menu
            if (MediaQuery.of(context).size.width > 768)
              Row(
                children: [
                  _buildNavItem('Bosh sahifa', 'home'),
                  _buildNavItem('Xizmatlar', 'services'),
                  _buildNavItem('Jarayon', 'process'),
                  _buildNavItem('Hikoyalar', 'testimonials'),
                  _buildNavItem('Aloqa', 'contact'),
                  const SizedBox(width: 16),

                  // Avatar + Popup Menu
                  user != null
                      ? PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'profile') {
                        Navigator.pushNamed(context, '/profile');
                      } else if (value == 'logout') {
                        Supabase.instance.client.auth.signOut();
                        Navigator.pushReplacementNamed(context, '/');
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'profile',
                        child: _buildMenuItem(Icons.person, 'Shaxsiy kabinet'),
                      ),
                      PopupMenuItem(
                        value: 'logout',
                        child: _buildMenuItem(Icons.logout, 'Chiqish'),
                      ),
                    ],
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[100],
                      backgroundImage: user.userMetadata?['avatar_url'] != null
                          ? NetworkImage(user.userMetadata!['avatar_url'])
                          : null,
                      child: user.userMetadata?['avatar_url'] == null
                          ? Text(
                        user.userMetadata?['name']?.substring(0, 1).toUpperCase() ?? '?',
                        style: const TextStyle(color: Colors.white),
                      )
                          : null,
                    ),
                  )
                      : ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text('Kirish'),
                  ),
                ],
              )
            else
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu, color: Colors.blueAccent),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                onSelected: (value) {
                  if (value == 'login') {
                    Navigator.pushNamed(context, '/login');
                  } else if (value == 'logout') {
                    Supabase.instance.client.auth.signOut();
                    Navigator.pushReplacementNamed(context, '/');
                  } else if (value == 'profile') {
                    Navigator.pushNamed(context, '/profile');
                  } else {
                    onNavigate(value);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'home',
                    child: _buildMenuItem(Icons.home, 'Bosh sahifa'),
                  ),
                  PopupMenuItem(
                    value: 'services',
                    child: _buildMenuItem(Icons.miscellaneous_services, 'Xizmatlar'),
                  ),
                  PopupMenuItem(
                    value: 'process',
                    child: _buildMenuItem(Icons.timeline, 'Jarayon'),
                  ),
                  PopupMenuItem(
                    value: 'testimonials',
                    child: _buildMenuItem(Icons.people_alt_outlined, 'Hikoyalar'),
                  ),
                  PopupMenuItem(
                    value: 'contact',
                    child: _buildMenuItem(Icons.mail_outline, 'Aloqa'),
                  ),
                  const PopupMenuDivider(),
                  if (user != null)
                    PopupMenuItem(
                      value: 'profile',
                      child: _buildMenuItem(Icons.person, 'Shaxsiy kabinet'),
                    ),
                  if (user != null)
                    PopupMenuItem(
                      value: 'logout',
                      child: _buildMenuItem(Icons.logout, 'Chiqish'),
                    ),
                  if (user == null)
                    PopupMenuItem(
                      value: 'login',
                      child: _buildMenuItem(Icons.login, 'Kirish'),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () => onNavigate(key),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 20),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
