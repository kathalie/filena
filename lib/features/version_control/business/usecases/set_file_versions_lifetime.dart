import '../../../../core/common/business/repository_interfaces/preferences_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/set_file_version_lifetime_params.dart';

class SetFileVersionLifetimeUseCase
    implements UseCase<void, SetFileVersionLifetimeParams> {
  final IPreferencesRepository preferencesRepository;

  const SetFileVersionLifetimeUseCase({
    required this.preferencesRepository,
  });

  @override
  Future<void> call(SetFileVersionLifetimeParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
