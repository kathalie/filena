import '../../../library_management/business/repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/file_version_entity.dart';
import '../params/get_current_file_version_params.dart';
import '../repository_interfaces/file_version_repository.dart';

class GetCurrentFileVersionUseCase
    implements UseCase<FileVersionEntity, GetCurrentFileVersionParams> {
  final FileVersionRepository fileVersionRepository;
  final FileRepository fileRepository;

  const GetCurrentFileVersionUseCase({
    required this.fileVersionRepository,
    required this.fileRepository,
  });

  @override
  Future<FileVersionEntity> call(GetCurrentFileVersionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
