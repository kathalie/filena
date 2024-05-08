import '../entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity> getUser(String userId);

  Future<void> addUser(UserEntity newUser);

  Future<UserEntity> updateUser(UserEntity updatedUser);

  Future<void> deleteUser(String userId);
}
