import '../repository_interfaces/file_repository.dart';

class UpdateFileMetadataUseCase {
  final FileRepository fileRepository;

  const UpdateFileMetadataUseCase({
    required this.fileRepository,
  });

  Future<void> call({
    required String fileId,
    List<String>? newTagIds,
    String? description,
    bool? isFavourite,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
