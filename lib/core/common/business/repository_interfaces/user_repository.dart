import '../entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getPreferences();

  Future<void> updatePreferences(UserEntity updatedPreferences);
}