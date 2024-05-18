import '../../../user/business/repository_interfaces/user_repository.dart';

class SetFileVersionLifetimeUseCase {
  final UserRepository userRepository;

  const SetFileVersionLifetimeUseCase({
    required this.userRepository,
  });

  Future<void> call({
    required int newLifetimeInDays,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
