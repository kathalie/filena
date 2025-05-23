import '../../business/repository_interfaces/file_repository.dart';
import '../../domain/entities/file_details_entity.dart';
import '../../domain/entities/file_entity.dart';
import '../datasource/dto/file_create_dto.dart';
import '../datasource/dto/file_dto.dart';
import '../datasource/dto/file_storage_metadata_dto.dart';
import '../datasource/file_datasource.dart';
import '../datasource/fs/fs_file_wrapper.dart';
import '../storage/storage_manager.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDataSource _fileDataSource;
  final StorageManager _storageManager;

  const FileRepositoryImpl({
    required FileDataSource fileDataSource,
    required StorageManager storageManager,
  })  : _storageManager = storageManager,
        _fileDataSource = fileDataSource;

  @override
  Future<List<FileEntity>> getFilteredFiles(
    int? parentFolderId,
    bool onlyFavourites,
    bool includeFromSubfolders,
  ) async {
    final filteredFileDtos = await _fileDataSource.getFilteredFiles(
      parentFolderId,
      onlyFavourites,
      includeFromSubfolders,
    );
    return Future.wait(
      filteredFileDtos.map(
        (fileDto) async {
          // final metadata = await _storageManager.retrieveMetadata(fileDto.name);

          return fileDto.toEntity(
            FileStorageMetadataDto(
              //TODO Read from storage
              // sizeInBytes: metadata.sizeInBytes,
              // timeCreated: metadata.timeCreated,
              // timeLastModified: metadata.timeLastModified,
              sizeInBytes: 0,
              timeCreated: DateTime.now(),
              timeLastModified: DateTime.now(),
            ),
          );
        },
      ),
    );
  }

  @override
  Stream get fileChanges => _fileDataSource.fileChanges;

  @override
  Future<void> createFile(String filePath, int? parentFolderId) async {
    final fsFileWrapper = FsFileWrapper(filePath);

    final fileCreateDto = FileCreateDto(
      name: fsFileWrapper.name,
      hash: await fsFileWrapper.contentHash,
      mimeType: await fsFileWrapper.mimeType ?? '',
      embeddings: await fsFileWrapper.embeddings,
    );

    //TODO save into storage with given id
    final fileId = await _fileDataSource.createFile(fileCreateDto, parentFolderId);

    // TODO load into storage with metadata
    // await _storageManager.addFile(
    //   data: newFileEntity.content,
    //   uniqueFileName: fileId.toString(),
    // );
  }

  @override
  Future<void> updateFile(updateFileEntity) {
    // TODO: implement updateFile
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFile(int fileId) async {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<void> removeFileFromFolder(int fileId, int folderId) {
    // TODO: implement removeFileFromFolder
    throw UnimplementedError();
  }

  @override
  Future<void> assignFileToFolder(int fileId, int folderId) async {
    await _fileDataSource.assignFileToFolder(fileId, folderId);
  }
}

extension on FileDto {
  FileEntity toEntity(FileStorageMetadataDto storageMetadata) => FileEntity(
        id: id,
        isFavourite: isFavourite,
        fileDetails: FileDetailsEntity(
          name: name,
          sizeInBytes: storageMetadata.sizeInBytes,
          timeCreated: storageMetadata.timeCreated,
          timeLastModified: storageMetadata.timeLastModified,
          mimeType: mimeType,
        ),
      );
}
