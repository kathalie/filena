import '../repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/delete_file_params.dart';

class DeleteFileUseCase implements UseCase<void, DeleteFileParams> {
  final IFileRepository fileRepository;

  const DeleteFileUseCase({
    required this.fileRepository,
  });

  @override
  Future<void> call(DeleteFileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
