import '../repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/move_file_params.dart';

class MoveFileUseCase implements UseCase<void, MoveFileParams> {
  final FileRepository fileRepository;

  const MoveFileUseCase({
    required this.fileRepository,
  });

  @override
  Future<void> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
