import 'dart:async';
import 'package:flutter/material.dart';

class PartnersSection extends StatefulWidget {
  const PartnersSection({super.key});

  @override
  State<PartnersSection> createState() => _PartnersSectionState();
}

class _PartnersSectionState extends State<PartnersSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;

  final List<String> partners = [
    'https://avatars.mds.yandex.net/i?id=1907b636e28a91173b8fbfac2437557a_l-10815658-images-thumbs&n=13',
    'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_6847f2b46dc45a54753eb5fb_6847f2b46dc45a54753eb5fc/scale_1200',
    'https://avatars.mds.yandex.net/i?id=570357464e883ebb030c2bdd43f94d41431d66cb-5232419-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=41baa6a4677f57a2b359467ea4fb4855cb30db59-4831580-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=632b52e542da1bce1c98211d522a2a1f23a4ba3b79b02fb4-5886887-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=9be1211b311f997f20154ee2e21fdee5_l-9380290-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=79566080b20da6b6cd6bfad38c583a828db1a761-12630875-images-thumbs&n=13',
  ];

  @override
  void initState() {
    super.initState();
    // AutoScroll faqat sahifa build bo‘lgach boshlanadi
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    const double scrollSpeed = 0.5;
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        final maxExtent = _scrollController.position.maxScrollExtent;
        final currentOffset = _scrollController.offset;
        final newOffset = currentOffset + scrollSpeed;

        if (newOffset >= maxExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(newOffset);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repeatedPartners = [...partners, ...partners];

    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          const Text(
            'Bizning Hamkorlar',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 80,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: repeatedPartners.length,
              itemBuilder: (context, index) {
                final imageUrl = repeatedPartners[index % partners.length];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.network(
                    imageUrl,
                    height: 60,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
