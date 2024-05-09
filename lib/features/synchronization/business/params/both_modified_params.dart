import '../../../version_control/business/entities/file_version_entity.dart';

class BothModifiedParams {
  final FileVersionEntity remoteFileVersion;
  final String localFileVersionId;

  const BothModifiedParams({
    required this.remoteFileVersion,
    required this.localFileVersionId,
  });
}
