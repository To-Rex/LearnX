import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String> uploadImage(File file, String bucket) async {
    final String fileName = '${const Uuid().v4()}.${file.path.split('.').last}';

    final storage = _client.storage.from(bucket);
    final response = await storage.upload(fileName, file);

    if (response.isEmpty) {
      throw Exception('Faylni yuklab bo‘lmadi');
    }

    // URL olish (public bo‘lsa)
    final url = storage.getPublicUrl(fileName);
    return url;
  }
}
