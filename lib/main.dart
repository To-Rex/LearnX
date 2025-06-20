import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:learnx/screens/dashboard_screen.dart';
import 'package:learnx/screens/home_screen.dart';
import 'package:learnx/screens/login_screen.dart';
import 'package:learnx/screens/profile_screen.dart';
import 'package:learnx/screens/register_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'admin/screens/admin_dashboard.dart';

Future<void> main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://sodllsmlpcfcfkircftk.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNvZGxsc21scGNmY2ZraXJjZnRrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk4MDk4NjksImV4cCI6MjA2NTM4NTg2OX0.p86xUci1ajLRNa7MZ9YSI5mVuU_qStMaGMUnoB0uevo',
  );
  runApp(WorkTravelApp());
}

class WorkTravelApp extends StatelessWidget {
  const WorkTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work and Travel Student Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/admin': (context) => const AdminDashboard(),
      },
    );
  }
}