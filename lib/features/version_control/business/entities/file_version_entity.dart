import '../../../../core/common/business/entities/supplementary_structures/file_location.dart';

class FileVersionEntity {
  final String id;
  final String fileId;
  final int sizeInBytes;
  final DateTime dateEdited;
  final FileLocation location;
//TODO bytes array?
  const FileVersionEntity({
    required this.id,
    required this.fileId,
    required this.sizeInBytes,
    required this.dateEdited,
    required this.location,
  });
}
