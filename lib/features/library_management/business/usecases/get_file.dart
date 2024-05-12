import '../entities/file_entity.dart';
import '../repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/get_file_params.dart';

class GetFileUseCase implements UseCase<FileEntity, GetFileParams> {
  final FileRepository fileRepository;

  const GetFileUseCase({
    required this.fileRepository,
  });

  @override
  Future<FileEntity> call(GetFileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
