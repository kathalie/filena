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
  })
      : _storageManager = storageManager,
        _fileDataSource = fileDataSource;
  @override
  Stream<List<FileEntity>> get filteredFiles =>
      _fileDataSource.filteredFiles.asyncMap((fileDtos) async {
        final futureEntities = fileDtos
            .map(
              (fileDto) async =>
              fileDto.toEntity(
                await _storageManager.retrieveMetadata(fileDto.name),
              ),
        )
            .toList();

        return await Future.wait(futureEntities);
      });

  @override
  Future<void> createFile(String filePath) async {
    final fsFileWrapper = FsFileWrapper(filePath);

    final fileCreateDto = FileCreateDto(
      name: fsFileWrapper.name,
      hash: await fsFileWrapper.contentHash,
      mimeType: await fsFileWrapper.mimeType ?? '',
      embeddings: await fsFileWrapper.embeddings,
    );

    print('Embeddings for file ${fsFileWrapper.name}${fsFileWrapper.extension}:');
    print(fileCreateDto.embeddings);

    //TODO save into storage with given id
    final fileId = await _fileDataSource.createFile(fileCreateDto);

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
  void setIncludeSubfoldersFilter(bool includeFromSubfolders) {
    // TODO: implement setIncludeSubfoldersFilter
  }

  @override
  void setOnlyFavouritesFilter(bool onlyFavourites) {
    // TODO: implement setOnlyFavouritesFilter
  }

  @override
  void setParentFolderFilter(int? parentFolderId) {
    // TODO: implement setParentFolderFilter
  }
}

extension on FileDto {
  FileEntity toEntity(FileStorageMetadataDto storageMetadata) =>
      FileEntity(
        id: id,
        isFavourite: isFavourite,
        fileDetails: FileDetailsEntity(
          name: name,
          //TODO Read from storage
          // sizeInBytes: storageMetadata.sizeInBytes,
          // timeCreated: storageMetadata.timeCreated,
          // timeLastModified: storageMetadata.timeLastModified,
          sizeInBytes: 0,
          timeCreated: DateTime.now(),
          timeLastModified: DateTime.now(),
          mimeType: mimeType,
        ),
      );
}
