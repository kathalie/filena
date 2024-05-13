import '../../business/entities/user_entity.dart';
import '../../business/repository_interfaces/user_repository.dart';
import '../data_source_interfaces/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  const UserRepositoryImpl({
    required this.userDataSource,
  });

  @override
  Future<UserEntity> getUser() {
    return userDataSource.getUser();
  }

  @override
  Future<void> updateUser(UserEntity updatedUser) {
    return userDataSource.updateUser(updatedUser);
  }

  @override
  Future<int> versionLifetimeInDays() async {
    return (await userDataSource.getUser()).versionsLifetimeInDays;
  }

  @override
  Future<bool> wantsEncryption() async {
    return (await userDataSource.getUser()).encryptFiles;
  }

  @override
  Future<bool> wantsVersionControl() async {
    return (await userDataSource.getUser()).versionsLifetimeInDays > 0;
  }

  @override
  Future<void> createUser(UserEntity newUser) {
    return userDataSource.createUser(newUser);
  }
}
