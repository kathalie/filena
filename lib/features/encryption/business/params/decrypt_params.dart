import 'dart:typed_data';

class DecryptParams {
  final Uint8List contentToDecrypt;

  const DecryptParams({
    required this.contentToDecrypt,
  });
}
