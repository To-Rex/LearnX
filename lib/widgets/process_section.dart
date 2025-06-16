import 'package:flutter/material.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 16),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          const Text(
            'Oddiy 4 bosqichli jarayon',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Ariza berishdan jo\'nashgacha, biz sizni xalqaro sayohatingizning har bir bosqichida yo\'l ko\'rsatamiz.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                return Row(
                  children: [
                    Expanded(child: _buildProcessStep(
                      '1',
                      'Onlayn ariza bering',
                      'Arizangizni yuboring va bizga maqsadlaringiz, qiziqishlaringiz va afzal ko\'rgan yo\'nalishlaringiz haqida ayting.',
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildProcessStep(
                      '2',
                      'Moslashtirish',
                      'Bizning jamoamiz sizni malakangiz va afzalliklaringizga asoslanib mukammal dastur bilan moslashtiramiz.',
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildProcessStep(
                      '3',
                      'Tayyorgarlik va o\'qitish',
                      'Bizning yordamimiz bilan viza arizalari, madaniy o\'qitish va jo\'nash oldidan tayyorgarlikni yakunlang.',
                    )),
                    const SizedBox(width: 24),
                    Expanded(child: _buildProcessStep(
                      '4',
                      'Sayohatingizni boshlang',
                      'Jamoamizning doimiy yordami bilan xalqaro ish va sayohat tajribangizni boshlang.',
                    )),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildProcessStep(
                      '1',
                      'Onlayn ariza bering',
                      'Arizangizni yuboring va bizga maqsadlaringiz, qiziqishlaringiz va afzal ko\'rgan yo\'nalishlaringiz haqida ayting.',
                    ),
                    const SizedBox(height: 32),
                    _buildProcessStep(
                      '2',
                      'Moslashtirish',
                      'Bizning jamoamiz sizni malakangiz va afzalliklaringizga asoslanib mukammal dastur bilan moslashtiramiz.',
                    ),
                    const SizedBox(height: 32),
                    _buildProcessStep(
                      '3',
                      'Tayyorgarlik va o\'qitish',
                      'Bizning yordamimiz bilan viza arizalari, madaniy o\'qitish va jo\'nash oldidan tayyorgarlikni yakunlang.',
                    ),
                    const SizedBox(height: 32),
                    _buildProcessStep(
                      '4',
                      'Sayohatingizni boshlang',
                      'Jamoamizning doimiy yordami bilan xalqaro ish va sayohat tajribangizni boshlang.',
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(String number, String title, String description) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}