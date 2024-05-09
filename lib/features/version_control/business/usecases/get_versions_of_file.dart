import '../../../../core/use_case/use_case.dart';
import '../entities/file_version_entity.dart';
import '../params/get_versions_of_file_params.dart';
import '../repository_interfaces/file_version_repository.dart';

class GetVersionsOfFileUseCase
    implements UseCase<FileVersionEntity, GetVersionsOfFileParams> {
  final IFileVersionRepository fileVersionRepository;

  const GetVersionsOfFileUseCase({
    required this.fileVersionRepository,
  });

  @override
  Future<FileVersionEntity> call(GetVersionsOfFileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
