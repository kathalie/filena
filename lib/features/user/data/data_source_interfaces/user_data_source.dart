import '../../business/entities/user_entity.dart';

abstract interface class UserDataSource {
  Future<UserEntity> getUser();

  Future<void> createUser(UserEntity newUser);

  Future<void> updateUser(UserEntity updatedUser);

  Future<void> deleteUser(String userId);
}
