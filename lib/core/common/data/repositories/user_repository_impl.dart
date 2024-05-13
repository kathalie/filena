import '../../business/entities/user_entity.dart';
import '../../business/repository_interfaces/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserEntity> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserEntity updatedPreferences) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<int> versionLifetimeInDays() {
    // TODO: implement versionLifetimeInDays
    throw UnimplementedError();
  }

  @override
  Future<bool> wantsEncryption() {
    // TODO: implement wantsEncryption
    throw UnimplementedError();
  }

  @override
  Future<bool> wantsVersionControl() {
    // TODO: implement wantsVersionControl
    throw UnimplementedError();
  }
  
}