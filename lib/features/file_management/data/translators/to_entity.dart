import '../../domain/entities/file_entity.dart';
import '../../domain/entities/file_metadata_entity.dart';
import '../dto/file_dto.dart';
import '../dto/file_storage_metadata_dto.dart';

extension FileDtoToEntity on FileDto {
  FileEntity toEntity(FileMetadataDto storageMetadata) => FileEntity(
    id: id,
    storageKey: storageKey,
    isPrioritized: isPrioritized,
    currentVersion: currentVersion,
    fileMetadata: FileMetadataEntity(
      name: storageMetadata.name,
      extension: storageMetadata.extension,
      sizeInBytes: storageMetadata.sizeInBytes,
      timeCreated: storageMetadata.timeCreated,
      timeLastModified: storageMetadata.timeLastModified,
      mimeType: mimeType,
    ),
  );
}