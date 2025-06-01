import 'package:uuid/uuid.dart';

import '../../common/helpers/file_category.dart';
import '../../common/helpers/fs_file_wrapper.dart';
import '../../domain/entities/file_metadata_entity.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/repository_interfaces/repository.dart';
import '../datasource_interfaces/embeddings_client.dart';
import '../datasource_interfaces/datasource.dart';
import '../datasource_interfaces/storage_manager.dart';
import '../datasource_interfaces/summary_client.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../dto/file_storage_metadata_dto.dart';
import '../translators/to_entity.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDataSource _fileDataSource;
  final StorageManager _storageManager;
  final EmbeddingsClient _embeddingsClient;
  final SummaryClient _summaryClient;

  const FileRepositoryImpl({
    required FileDataSource fileDataSource,
    required StorageManager storageManager,
    required EmbeddingsClient embeddingsClient,
    required SummaryClient summaryClient,
  })  : _storageManager = storageManager,
        _fileDataSource = fileDataSource,
        _embeddingsClient = embeddingsClient,
        _summaryClient = summaryClient;

  @override
  Future<List<FileEntity>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  ) async {
    final filteredFileDtos = await _fileDataSource.getFilteredFiles(
      parentFolderId,
      onlyPrioritized,
      includeFromSubfolders,
    );

    return _getFileEntities(filteredFileDtos);
  }

  @override
  Future<List<FileEntity>> getUnclassifiedFiles(FileCategory? category) async {
    final fileDtos = await _fileDataSource.getUnclassifiedFiles(category);

    return _getFileEntities(fileDtos);
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
            objectName: fileDto.storageKey,
          );

          return fileDto.toEntity(
            FileMetadataDto(
              sizeInBytes: metadata.sizeInBytes,
              timeCreated: metadata.timeCreated,
              timeLastModified: metadata.timeLastModified,
            ),
          );
        },
      ),
    );
  }

  @override
  Stream get fileChanges => _fileDataSource.fileChanges;
  @override
  Stream get fileInFolderChanges => _fileDataSource.fileInFolderChanges;

  @override
  Future<void> createFile(String filePath, int parentFolderId) async {
    final uuid = const Uuid().v1();

    final fsFileWrapper = FsFileWrapper(filePath);
    final name = '${fsFileWrapper.name}${fsFileWrapper.extension}';
    final mimeType = await fsFileWrapper.mimeType;

    final bytes = await fsFileWrapper.contentAsBytes;
    final metadata = await fsFileWrapper.metadata;

    await _storageManager.uploadFile(
      objectName: uuid,
      bytes: bytes,
      metadata: FileMetadataEntity(
        sizeInBytes: metadata.size,
        timeCreated: metadata.modified,
        timeLastModified: metadata.changed,
      ),
    );

    final summary = await _summaryClient.generateSummary(fsFileWrapper);
    final embeddings = await _embeddingsClient.generateEmbeddings(summary);

    final fileCreateDto = FileCreateDto(
      storageKey: uuid,
      name: name,
      mimeType: mimeType,
      embeddings: embeddings,
    );

    await _fileDataSource.createFile(
      fileCreateDto,
      parentFolderId,
    );
  }

  @override
  Future<void> deleteFile(int fileId) async {
    await _storageManager.removeFile(fileStoragePath: fileId.toString());

    await _fileDataSource.deleteFile(fileId);
  }

  @override
  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId) async {
    await _fileDataSource.removeFilesFromFolder(fileIds, folderId);
  }

  @override
  Future<void> assignFileToFolder(int fileId, int folderId) async {
    await _fileDataSource.assignFileToFolder(fileId, folderId);
  }

  @override
  Future<void> renameFile(int fileId, String newName) async {
    await _fileDataSource.renameFile(fileId, newName);
  }

  @override
  Future<void> togglePrioritized(int fileId) async {
    await _fileDataSource.togglePrioritized(fileId);
  }

  @override
  Future<List<int>> getParentFolderIds(int fileId) => _fileDataSource.getParentFolderIds(fileId);
}
