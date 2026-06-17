import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

/// Manages local cache for email attachments.
class AttachmentCache {
  static const _cacheDir = 'attachments';

  /// Get the local cache directory.
  Future<Directory> get _cacheDirectory async {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(appDir.path, _cacheDir));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// Save attachment data to cache.
  Future<String> save(String attachmentId, Uint8List data, String? filename) async {
    final dir = await _cacheDirectory;
    final ext = filename != null ? p.extension(filename) : '';
    final file = File(p.join(dir.path, '$attachmentId$ext'));
    await file.writeAsBytes(data);
    return file.path;
  }

  /// Get cached attachment path.
  Future<String?> getPath(String attachmentId, String? filename) async {
    final dir = await _cacheDirectory;
    final ext = filename != null ? p.extension(filename) : '';
    final file = File(p.join(dir.path, '$attachmentId$ext'));
    if (await file.exists()) return file.path;
    return null;
  }

  /// Delete cached attachment.
  Future<void> delete(String attachmentId, String? filename) async {
    final dir = await _cacheDirectory;
    final ext = filename != null ? p.extension(filename) : '';
    final file = File(p.join(dir.path, '$attachmentId$ext'));
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Clear all cached attachments.
  Future<void> clearAll() async {
    final dir = await _cacheDirectory;
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }

  /// Get cache size in bytes.
  Future<int> getCacheSize() async {
    final dir = await _cacheDirectory;
    int size = 0;
    if (await dir.exists()) {
      await for (final entity in dir.list(recursive: true)) {
        if (entity is File) {
          size += await entity.length();
        }
      }
    }
    return size;
  }
}
