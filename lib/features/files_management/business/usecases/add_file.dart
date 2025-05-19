import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import '../../domain/entities/new_file_entity.dart';
import '../repository_interfaces/file_repository.dart';

class AddFileUseCase {
  final FileRepository fileRepository;

  const AddFileUseCase({
    required this.fileRepository,
  });

  Future<void> call(NewFileEntity newFileEntity) async {
    final hash = await _hashFile(newFileEntity.content);

    await fileRepository.addFile(newFileEntity, hash);
  }

  Future<String> _hashFile(Stream<Uint8List> data) async {
    final output = AccumulatorSink<Digest>();
    final input = md5.startChunkedConversion(output);

    await data.forEach(input.add);
    input.close();

    final digest = output.events.single;

    return digest.toString();
  }
}

