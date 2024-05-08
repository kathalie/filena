import '../../domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<void> register(UserEntity newUser, String password);

  Future<UserEntity> login(String email, String password);

  Future<void> logout(String userId);
}
