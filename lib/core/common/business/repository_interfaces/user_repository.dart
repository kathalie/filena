import '../entities/user_entity.dart';

abstract interface class UserRepository {
  Future<UserEntity> getUser();

  Future<void> updateUser(UserEntity updatedPreferences);

  Future<bool> wantsEncryption();

  Future<bool> wantsVersionControl();

  Future<int> versionLifetimeInDays();
}