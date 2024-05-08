import '../../../../core/common/business/repository_interfaces/file_repository.dart';
import '../../../../core/common/domain/entities/file_entity.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/get_file_params.dart';

class GetFileUseCase implements UseCase<FileEntity, GetFileParams> {
  final IFileRepository fileRepository;

  const GetFileUseCase({
    required this.fileRepository,
  });

  @override
  Future<FileEntity> call(GetFileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
