import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/section.dart';
import '../models/section_item.dart';

class SupabaseService {
  final SupabaseClient client = Supabase.instance.client;



  Future<List<Section>> fetchSections() async {
    final response = await client.from('sections').select().order('name');
    return (response as List).map((e) => Section.fromMap(e)).toList();
  }

  Future<void> updateSectionVisibility(String id, bool isVisible) async {
    await client
        .from('sections')
        .update({'is_visible': isVisible})
        .eq('id', id);
  }

  Future<void> createSection(Section section) async {
    await client.from('sections').insert(section.toMap());
  }

  Future<void> deleteSection(String id) async {
    await client.from('sections').delete().eq('id', id);
  }

  Future<List<SectionItem>> fetchItemsBySection(String sectionId) async {
    final res = await client
        .from('section_items')
        .select('*')
        .eq('section_id', sectionId)
        .order('sort_order');
    return res.map((e) => SectionItem.fromJson(e)).toList();
  }

  // Fetch Programs
  Future<List<Map<String, dynamic>>> getPrograms() async {
    final res = await client.from('programs').select().order('created_at');
    return List<Map<String, dynamic>>.from(res);
  }

  // Fetch News
  Future<List<Map<String, dynamic>>> getNews() async {
    final res = await client.from('news').select().order('created_at');
    return List<Map<String, dynamic>>.from(res);
  }

  // Fetch FAQs
  Future<List<Map<String, dynamic>>> getFaqs() async {
    final res = await client.from('faqs').select().order('created_at');
    return List<Map<String, dynamic>>.from(res);
  }

  // Fetch Testimonials
  Future<List<Map<String, dynamic>>> getTestimonials() async {
    final res = await client.from('testimonials').select().order('created_at');
    return List<Map<String, dynamic>>.from(res);
  }
}
