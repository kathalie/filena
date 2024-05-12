import 'dart:typed_data';

class EncryptParams {
  final Uint8List contentToEncrypt;

  const EncryptParams({
    required this.contentToEncrypt,
  });
}
