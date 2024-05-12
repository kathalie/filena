import '../entities/file_entity.dart';

class AddFileParams {
  final FileEntity fileEntity;
  final String destinationAlbumId;

  const AddFileParams({
    required this.fileEntity,
    required this.destinationAlbumId,
  });
}
