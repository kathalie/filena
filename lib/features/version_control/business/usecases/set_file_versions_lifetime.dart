import '../../../../core/use_case/use_case.dart';
import '../../../user/business/repository_interfaces/user_repository.dart';
import '../params/set_file_version_lifetime_params.dart';

class SetFileVersionLifetimeUseCase
    implements UseCase<void, SetFileVersionLifetimeParams> {
  final UserRepository userRepository;

  const SetFileVersionLifetimeUseCase({
    required this.userRepository,
  });

  @override
  Future<void> call(SetFileVersionLifetimeParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
