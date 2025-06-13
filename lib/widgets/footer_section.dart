import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      color: Colors.grey.shade900,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flight_takeoff,
                size: 32,
                color: Colors.blue.shade400,
              ),
              const SizedBox(width: 8),
              Text(
                'WorkTravel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Talabalarni mazmunli ish va sayohat tajribalari orqali dunyoni kashf etishga imkon berish.\nGlobal imkoniyatlarga sizning eshigingiz shu yerdan boshlanadi.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            height: 1,
            color: Colors.grey.shade800,
          ),
          const SizedBox(height: 32),
          Text(
            '© 2024 WorkTravel. Barcha huquqlar himoyalangan. | Kelajakni o\'zgartirish, bir sayohat orqali.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}