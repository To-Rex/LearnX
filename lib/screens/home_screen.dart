import 'package:flutter/material.dart';

import '../widgets/contact_section.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/process_section.dart';
import '../widgets/services_section.dart';
import '../widgets/testimonials_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> sectionKeys = {
    'home': GlobalKey(),
    'services': GlobalKey(),
    'process': GlobalKey(),
    'testimonials': GlobalKey(),
    'contact': GlobalKey(),
  };

  void scrollToSection(String key) {
    final targetContext = sectionKeys[key]?.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80), // navbarga joy tashlaymiz
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(key: sectionKeys['home']),
                  ServicesSection(key: sectionKeys['services']),
                  ProcessSection(key: sectionKeys['process']),
                  TestimonialsSection(key: sectionKeys['testimonials']),
                  ContactSection(key: sectionKeys['contact']),
                  const FooterSection(),
                ],
              ),
            ),
          ),

          /// CustomNavigationBar doim tepada turadi
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(onNavigate: scrollToSection),
          ),
        ],
      ),
    );
  }
}