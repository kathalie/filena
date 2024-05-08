import '../entities/file_version_entity.dart';

class CreateFileVersionParams {
  final FileVersionEntity newFileVersion;

  const CreateFileVersionParams({
    required this.newFileVersion,
  });
}
