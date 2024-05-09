import '../../../../core/use_case/use_case.dart';
import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../params/both_modified_params.dart';

class BothModifiedUseCase implements UseCase<void, BothModifiedParams> {
  final IFileVersionRepository fileVersionRepository;

  const BothModifiedUseCase({
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(BothModifiedParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
