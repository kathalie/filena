import '../../../library_management/business/repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/change_version_of_file_params.dart';

class ChangeVersionOfFileUseCase
    implements UseCase<void, ChangeVersionOfFileParams> {
  final IFileRepository fileRepository;

  const ChangeVersionOfFileUseCase({
    required this.fileRepository,
  });

  @override
  Future<void> call(ChangeVersionOfFileParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
