import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/certificate_model.dart';

class CertificateService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<CertificateModel>> getCertificates() async {
    try {
      final data = await _client.rpc('get_all_certificates').select();
      return (data as List)
          .map((e) => CertificateModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Sertifikatlarni olishda xatolik: $e');
      return [];
    }
  }

  Future<void> addCertificate(String title, String imageUrl) async {
    await _client.rpc('add_certificate', params: {
      'cert_title': title,
      'cert_image_url': imageUrl,
    });
  }

  Future<void> deleteCertificate(id) async {
    await _client.rpc('delete_certificate', params: {'p_id': id});
  }
}
