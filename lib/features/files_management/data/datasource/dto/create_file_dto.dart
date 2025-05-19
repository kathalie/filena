import '../../../domain/entities/new_file_entity.dart';

class CreateFileDto {
  final String name, hash, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;

  const CreateFileDto({
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });

  CreateFileDto.fromEntity(NewFileEntity newFileEntity, this.hash)
      : name = newFileEntity.name,
        mimeType = newFileEntity.mimeType,
        sizeInBytes = newFileEntity.sizeInBytes,
        timeCreated = newFileEntity.timeCreated,
        timeLastModified = newFileEntity.timeLastModified;
}
