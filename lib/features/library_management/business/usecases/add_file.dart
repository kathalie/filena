import '../../../../core/common/business/repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/add_file_params.dart';

class AddFileUseCase implements UseCase<void, AddFileParams> {
  final IFileRepository fileRepository;

  const AddFileUseCase({
    required this.fileRepository,
  });

  @override
  Future<void> call(AddFileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
