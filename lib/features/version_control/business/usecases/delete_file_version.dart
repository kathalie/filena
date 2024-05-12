import '../../../../core/use_case/use_case.dart';
import '../params/delete_file_version_params.dart';
import '../repository_interfaces/file_version_repository.dart';

class DeleteFileVersionUseCase
    implements UseCase<void, DeleteFileVersionParams> {
  final FileVersionRepository fileVersionRepository;

  const DeleteFileVersionUseCase({
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(DeleteFileVersionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
