import 'dart:io';

class FileWriter {
  static Future<void> create(String path, String content) async {
    final file = File(path);

    if (await file.exists()) {
      print('✅ File already exists: $path');
      return;
    }

    await file.create(recursive: true);
    await file.writeAsString(content);

    print('📄 Created: $path');
  }
}
