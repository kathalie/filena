import '../../common/helpers/fs_file_wrapper.dart';
import '../../domain/entities/file_metadata_entity.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/repository_interfaces/file_repository.dart';
import '../datasource/embeddings_client.dart';
import '../datasource_interfaces/datasource.dart';
import '../datasource_interfaces/storage_manager.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../dto/file_storage_metadata_dto.dart';
import '../translators/to_entity.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDataSource _fileDataSource;
  final StorageManager _storageManager;
  final EmbeddingsClient _embeddingsClient;

  const FileRepositoryImpl({
    required FileDataSource fileDataSource,
    required StorageManager storageManager,
    required EmbeddingsClient embeddingsClient,
  })  : _storageManager = storageManager,
        _fileDataSource = fileDataSource,
        _embeddingsClient = embeddingsClient;

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

    return _getFileEntities(filteredFileDtos);
  }

  @override
  Future<List<FileEntity>> getFiles(List<int> fileIds) async {
    final fileDtos = await _fileDataSource.getFiles(fileIds);

    return _getFileEntities(fileDtos);
  }

  Future<List<FileEntity>> _getFileEntities(Iterable<FileDto> fileDtos) {
    return Future.wait(
      fileDtos.map(
        (fileDto) async {
          final metadata = await _storageManager.getFileMetadata(
            objectName: fileDto.id.toString(),
          );

          //TODO lazy load or store in db. Works very slowly.
          return fileDto.toEntity(
            FileMetadataDto(
              sizeInBytes: metadata.sizeInBytes,
              timeCreated: metadata.timeCreated,
              timeLastModified: metadata.timeLastModified,
              name: metadata.name,
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
    final hash = await fsFileWrapper.contentHash;
    final mimeType = await fsFileWrapper.mimeType;
    final embeddings = await _embeddingsClient.getEmbeddings(fsFileWrapper);

    final fileCreateDto = FileCreateDto(
      hash: hash,
      mimeType: mimeType,
      embeddings: embeddings,
    );

    final fileId = await _fileDataSource.createFile(
      fileCreateDto,
      parentFolderId,
    );

    final bytes = await fsFileWrapper.contentAsBytes;
    final metadata = await fsFileWrapper.metadata;

    await _storageManager.uploadFile(
      objectName: fileId.toString(),
      bytes: bytes,
      metadata: FileMetadataEntity(
        name: fsFileWrapper.name,
        sizeInBytes: metadata.size,
        timeCreated: metadata.modified,
        timeLastModified: metadata.changed,
        mimeType: mimeType,
      ),
    );
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


