import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../entities/file_entity.dart';
import '../repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/find_files_params.dart';

class FindFilesUseCase implements UseCase<List<FileEntity>, FindFilesParams> {
  final FileRepository fileRepository;
  final FileVersionRepository fileVersionRepository;

  const FindFilesUseCase({
    required this.fileRepository,
    required this.fileVersionRepository,
  });

  @override
  Future<List<FileEntity>> call(FindFilesParams params) async {
    return await fileRepository.getFilesFromCollection(params.collectionId);
  }
}
