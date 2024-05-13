import '../entities/user_entity.dart';

abstract interface class UserRepository {
  Future<UserEntity> getUser();

  Future<void> createUser(UserEntity newUser);

  Future<void> updateUser(UserEntity updatedUser);

  Future<bool> wantsEncryption();

  Future<bool> wantsVersionControl();

  Future<int> versionLifetimeInDays();
}
