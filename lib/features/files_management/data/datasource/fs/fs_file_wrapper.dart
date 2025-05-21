import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:mime/mime.dart';

class FsFileWrapper {
  final File file;

  FsFileWrapper(String filePath):
      file = File(filePath);


  Future<FileStat> metadata() async {
    await _ensureFileExists(file);

    return await file.stat();
  }

  Future<String> fileHash() async {
    await _ensureFileExists(file);

    final output = AccumulatorSink<Digest>();
    final input = md5.startChunkedConversion(output);

    final stream = file.openRead();

    await for (var chunk in stream) {
      input.add(chunk);
    }

    input.close();

    final digest = output.events.single;

    return digest.toString();
  }

  Future<String?> mimeType() async {
    final bytes = await contentAsBytes();
    final headerBytes = bytes.take(16).toList();

    return lookupMimeType(file.path, headerBytes: headerBytes);
  }

  Future<String> contentAsString() async {
    return await file.readAsString();
  }

  Future<Uint8List> contentAsBytes() async {
    return await file.readAsBytes();
  }

  Future<String> contentAsBase64() async {
    final bytes = await file.readAsBytes();

    return base64Encode(bytes);
  }

  Future<void> _ensureFileExists(File file) async {
    if (!await file.exists()) {
      throw FileSystemException('File not found', file.path);
    }
  }
}