import '../../../domain/entities/new_file_entity.dart';

class CreateFileDao {
  final String name, hash, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;

  const CreateFileDao({
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });

  CreateFileDao.fromEntity(NewFileEntity newFileEntity, this.hash)
      : name = newFileEntity.name,
        mimeType = newFileEntity.mimeType,
        sizeInBytes = newFileEntity.sizeInBytes,
        timeCreated = newFileEntity.timeCreated,
        timeLastModified = newFileEntity.timeLastModified;
}
