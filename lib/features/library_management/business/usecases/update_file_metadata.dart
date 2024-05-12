import '../repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/update_file_metadata_params.dart';

class UpdateFileMetadataUseCase
    implements UseCase<void, UpdateFileMetadataParams> {
  final IFileRepository fileRepository;

  const UpdateFileMetadataUseCase({
    required this.fileRepository,
  });

  @override
  Future<void> call(UpdateFileMetadataParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
