import '../../business/entities/user_entity.dart';
import '../data_source_interfaces/user_data_source.dart';

class UserDao implements UserDataSource {
  @override
  Future<void> createUser(UserEntity newUser) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserEntity updatedUser) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
