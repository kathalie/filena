import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/encryption/business/usecases/decrypt.dart';
import '../../../features/encryption/business/usecases/encrypt.dart';

part 'encryption_usecases_di.g.dart';

@riverpod
EncryptUseCase encryptUsecase(EncryptUsecaseRef ref) {
  return EncryptUseCase();
}

@riverpod
DecryptUseCase decryptUseCase(DecryptUseCaseRef ref) {
  return DecryptUseCase();
}