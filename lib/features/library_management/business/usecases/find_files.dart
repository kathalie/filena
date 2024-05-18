import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../entities/file_entity.dart';
import '../repository_interfaces/file_repository.dart';

enum SortOrder {
  asc,
  desc,
}

enum SortField {
  date,
}

class FindFilesUseCase {
  final FileRepository fileRepository;
  final FileVersionRepository fileVersionRepository;

  const FindFilesUseCase({
    required this.fileRepository,
    required this.fileVersionRepository,
  });

  Future<List<FileEntity>> call({
    required String collectionId,
    SortField sortField = SortField.date,
    SortOrder sortOrder = SortOrder.asc,
    String? descriptionPart,
    List<String>? tagIds,
    bool? isChosen,
    (DateTime dateCreatedFrom, DateTime dateCreatedTo)? dateCreatedRange,
  }) async {
    return await fileRepository.getFilesFromCollection(collectionId);
  }
}
