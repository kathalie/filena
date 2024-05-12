import 'dart:typed_data';

import '../../../../core/use_case/use_case.dart';
import '../params/decrypt_params.dart';

class DecryptUseCase implements UseCase<Uint8List, DecryptParams> {
  @override
  Future<Uint8List> call(DecryptParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}