import 'dart:typed_data';

import '../repository_interfaces/file_repository.dart';

class AddFileUseCase {
  final FileRepository fileRepository;

  const AddFileUseCase({
    required this.fileRepository,
  });

  Future<void> call({
    required String parentCollectionId,
    required String categoryName,
    required String name,
    required DateTime dateCreated,
    required int sizeInBytes,
    required Uint8List content,
    required String? description,
    required List<String> tagIds,
    required bool isFavourite,
  }) async {
    await fileRepository.createFile(
      parentCollectionId: parentCollectionId,
      categoryName: categoryName,
      name: name,
      dateCreated: dateCreated,
      sizeInBytes: sizeInBytes,
      content: content,
      description: description,
      tagIds: tagIds,
      isFavourite: isFavourite,
    );
  }
}
