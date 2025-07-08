import 'dart:async';
import 'package:flutter/material.dart';
import '../models/partner_model.dart';
import '../services/partner_service.dart';

class PartnersSection extends StatefulWidget {
  const PartnersSection({super.key});

  @override
  State<PartnersSection> createState() => _PartnersSectionState();
}

class _PartnersSectionState extends State<PartnersSection> {
  final ScrollController _scrollController = ScrollController();
  final PartnerService _partnerService = PartnerService();
  Timer? _scrollTimer;

  List<PartnerModel> _partners = [];

  @override
  void initState() {
    super.initState();
    _loadPartners();
  }

  Future<void> _loadPartners() async {
    final partners = await _partnerService.getPartners();
    if (!mounted) return;

    setState(() {
      _partners = [...partners, ...partners]; // scroll uchun ikki marta takrorlanmoqda
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    const double scrollSpeed = 0.5;
    _scrollTimer?.cancel();

    _scrollTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!mounted || !_scrollController.hasClients) {
        timer.cancel();
        return;
      }

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentOffset = _scrollController.offset;
      final newOffset = currentOffset + scrollSpeed;

      if (newOffset >= maxScroll) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(newOffset);
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
            child: _partners.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _partners.length,
              itemBuilder: (context, index) {
                final partner = _partners[index];
                final imageUrl = partner.photo;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? Image.network(
                    imageUrl,
                    height: 60,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.error),
                  )
                      : const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}