import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data'; // <<< BU QATORNI QO‘SHING
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class WebStorageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String?> pickAndUploadImage({required String bucket}) async {
    final completer = Completer<String?>();

    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    input.onChange.listen((event) async {
      final file = input.files?.first;
      if (file == null) {
        completer.complete(null);
        return;
      }

      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((e) async {
        final fileData = reader.result as List<int>;
        final fileBytes = Uint8List.fromList(fileData); // ✅ to'g'ri format
        final fileExt = file.name.split('.').last;
        final filePath = '${const Uuid().v4()}.$fileExt';

        try {
          final storage = _client.storage.from(bucket);
          await storage.uploadBinary(
            filePath,
            fileBytes,
            fileOptions: FileOptions(upsert: true),
          );

          final publicUrl = storage.getPublicUrl(filePath);
          completer.complete(publicUrl);
        } catch (e) {
          print('❌ Faylni yuklashda xatolik: $e');
          completer.complete(null);
        }
      });
    });

    return completer.future;
  }
}
