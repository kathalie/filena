import 'dart:typed_data';

import '../../../../core/use_case/use_case.dart';
import '../params/encrypt_params.dart';

class EncryptUseCase implements UseCase<Uint8List, EncryptParams> {
  @override
  Future<Uint8List> call(EncryptParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
