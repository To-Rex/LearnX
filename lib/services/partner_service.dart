import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/partner_model.dart';

class PartnerService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<PartnerModel>> getPartners() async {
    try {
      // faqat LANGUAGE SQL bo‘lsa ishlaydi
      final data = await _client.rpc('get_all_partners').select();

      print(data);
      return (data as List)
          .map((e) => PartnerModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Hamkorlarni olishda xatolik: $e');
      return [];
    }
  }

  Future<void> addPartner(String name, String photo, String location, String cauntry) async {
    await _client.rpc('add_partner', params: {
      'p_name': name,
      'p_photo': photo,
      'p_location': location,
      'p_cauntry': cauntry,
    });
  }
}
