import 'file_details_entity.dart';

class FileEntity {
  final int id;
  final bool isFavourite;
  final FileDetailsEntity fileDetails;

  const FileEntity({
    required this.id,
    required this.isFavourite,
    required this.fileDetails,
  });
}