/*
import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSliderSectionState();
}

class _HeroSliderSectionState extends State<HeroSection> {
  final List<String> _imageUrls = [
    'https://avatars.mds.yandex.net/i?id=a400664279e16ea3f65175c0aa0327cf_l-3597607-images-thumbs&n=13',
    'https://images.unsplash.com/photo-1485217988980-11786ced9454?auto=format&fit=crop&w=1600&q=80',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=80',
    'https://avatars.mds.yandex.net/i?id=f92fda9bfa779de50739656b5f03b935_l-5233451-images-thumbs&n=13',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startSlider();
  }

  void _startSlider() {
    Future.delayed(const Duration(seconds: 6), () {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
      _startSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.network(
              _imageUrls[_currentIndex],
              key: ValueKey<String>(_imageUrls[_currentIndex]),
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Rasm yuklanmadi')),
            ),
          ),

          // Black gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // Centered content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Jahon imkoniyatlariga',
                      style: TextStyle(
                        fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Eshigingiz',
                      style: TextStyle(
                        fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Kelajagingizni bizning keng qamrovli ish va sayohat dasturlari bilan o\'zgartiring. Biz ambitsiyali talabalarga dunyo bo\'ylab qimmatli ish tajribasi olishda yordam beramiz.',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Dasturlarni ko\'rish',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white, width: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Bugun boshlang',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/






import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSliderSectionState();
}

class _HeroSliderSectionState extends State<HeroSection> {
  final List<String> _imageUrls = [
    'https://avatars.mds.yandex.net/i?id=a400664279e16ea3f65175c0aa0327cf_l-3597607-images-thumbs&n=13',
    'https://images.unsplash.com/photo-1485217988980-11786ced9454?auto=format&fit=crop&w=1600&q=80',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1600&q=80',
    'https://avatars.mds.yandex.net/i?id=f92fda9bfa779de50739656b5f03b935_l-5233451-images-thumbs&n=13',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startSlider();
  }

  void _startSlider() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
      _startSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return SizedBox(
      height: height * 0.95,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image slider
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.network(
              _imageUrls[_currentIndex],
              key: ValueKey<String>(_imageUrls[_currentIndex]),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Rasm yuklanmadi')),
            ),
          ),

          // Overlay (gradient)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.65),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.65),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // Foreground text and buttons
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Jahon imkoniyatlariga',
                      style: TextStyle(
                        fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Eshigingiz',
                      style: TextStyle(
                        fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Kelajagingizni bizning keng qamrovli ish va sayohat dasturlari bilan o\'zgartiring. Biz ambitsiyali talabalarga dunyo bo\'ylab qimmatli ish tajribasi olishda yordam beramiz.',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Dasturlarni ko\'rish',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white, width: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Bugun boshlang',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
