import '../entities/file_entity.dart';
import '../repository_interfaces/file_repository.dart';

class GetFilesWithinCollectionUseCase {
  final FileRepository fileRepository;

  const GetFilesWithinCollectionUseCase({
    required this.fileRepository,
  });

  Future<List<FileEntity>> call({
    required String parentCollectionId,
  }) {
    return fileRepository.getFilesFromCollection(parentCollectionId);
  }
}
