import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/news_model.dart';

class NewsService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<NewsModel>> getNews() async {
    try {
      final data = await _client.rpc('get_all_news').select();

      return (data as List)
          .map((e) => NewsModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('News olishda xatolik: $e');
      return [];
    }
  }

  Future<void> addNews({
    required String title,
    required String shortText,
    required String fullText,
    required String imageUrl,
    required DateTime date,
  }) async {
    await _client.rpc('add_news', params: {
      'p_title': title,
      'p_short_text': shortText,
      'p_full_text': fullText,
      'p_image_url': imageUrl,
      'p_date': date.toIso8601String(),
    });
  }

  Future<void> deleteNews(String id) async {
    await _client.rpc('delete_news', params: {'p_id': id});
  }

}
