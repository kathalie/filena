import '../../../../core/use_case/use_case.dart';
import '../params/create_file_version_params.dart';
import '../repository_interface/file_version_repository.dart';

class CreateFileVersionUseCase
    implements UseCase<void, CreateFileVersionParams> {
  final IFileVersionRepository fileVersionRepository;

  const CreateFileVersionUseCase({
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(CreateFileVersionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
