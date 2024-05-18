import '../entities/file_entity.dart';
import '../repository_interfaces/file_repository.dart';

class AddFileUseCase {
  final FileRepository fileRepository;

  const AddFileUseCase({
    required this.fileRepository,
  });

  Future<void> call({
    required FileEntity fileEntity,
    required String destinationAlbumId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
