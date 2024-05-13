import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/encryption/business/usecases/decrypt.dart';
import '../../../features/encryption/business/usecases/encrypt.dart';

final encryptUseCaseProvider = Provider<EncryptUseCase>((ref) {
  return EncryptUseCase();
});

final decryptUseCaseProvider = Provider<DecryptUseCase>((ref) {
  return DecryptUseCase();
});