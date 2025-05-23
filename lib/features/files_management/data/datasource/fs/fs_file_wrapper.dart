import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:get_it/get_it.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import '../../../../embeddings/business/repository_interfaces/embeddings_repository.dart';
import '../../../business/use_cases/get_file_category.dart';
import '../../../domain/enums/file_category.dart';

class FsFileWrapper {
  final _embeddingsRepository = GetIt.I.get<EmbeddingsRepository>();

  final File file;
  late final String name;
  late final String extension;
  late final Future<FileStat> metadata;
  late final Future<String> contentHash;
  late final Future<String?> mimeType;
  late final Future<FileCategory> category;

  FsFileWrapper(String filePath) :
        file = File(filePath){
    name = _name;
    extension = _extension;
    metadata = _metadata;
    contentHash = _contentHash;
    mimeType = _mimeType;
    category = _category;
  }

  Future<String> get contentAsString async {
    return await file.readAsString();
  }

  Future<Uint8List> get contentAsBytes async {
    return await file.readAsBytes();
  }

  Future<String> get contentAsBase64 async {
    final bytes = await file.readAsBytes();

    return base64Encode(bytes);
  }

  Future<List<double>> get embeddings async {
    final fileCategory = await category;

    final List<double> embeddings = switch (fileCategory) {
      FileCategory.image => (await _embeddingsRepository
          .getEmbeddingForImage(await contentAsBase64))
          .embeddings,
      FileCategory.video =>
      (await _embeddingsRepository.getEmbeddingForText(await contentAsString))
          .embeddings,
      FileCategory.audio => <double>[],
      FileCategory.document => <double>[],
      FileCategory.other => <double>[]
    };

    return embeddings;
  }

  String get _name => path.basenameWithoutExtension(file.path);

  String get _extension => path.extension(file.path);

  Future<FileStat> get _metadata async {
    return await file.stat();
  }

  Future<String> get _contentHash async {
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

  Future<String?> get _mimeType async {
    final bytes = await contentAsBytes;
    final headerBytes = bytes.take(16).toList();

    return lookupMimeType(file.path, headerBytes: headerBytes);
  }

  Future<FileCategory> get _category async {
    final mimeType = await this.mimeType;

    final getFileCategory = GetFileCategoryUseCase();

    return getFileCategory(mimeType ?? '');
  }
}
