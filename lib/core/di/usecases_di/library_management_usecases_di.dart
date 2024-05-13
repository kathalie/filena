import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/library_management/business/usecases/add_file.dart';
import '../../../features/library_management/business/usecases/create_collection.dart';
import '../../../features/library_management/business/usecases/create_tag.dart';
import '../../../features/library_management/business/usecases/delete_collection_cascade.dart';
import '../../../features/library_management/business/usecases/delete_file.dart';
import '../../../features/library_management/business/usecases/delete_tag.dart';
import '../../../features/library_management/business/usecases/find_files.dart';
import '../../../features/library_management/business/usecases/get_file.dart';
import '../../../features/library_management/business/usecases/move_file.dart';
import '../../../features/library_management/business/usecases/update_collection.dart';
import '../../../features/library_management/business/usecases/update_file_metadata.dart';
import '../../../features/library_management/business/usecases/update_tag.dart';
import '../repositories_di.dart';

// TODO part (?)

final addFileUsecaseProvider = Provider<AddFileUseCase>((ref) {
  return AddFileUseCase(
    fileRepository: ref.read(fileRepoProvider),
  );
});

final createCollectionUsecaseProvider =
    Provider<CreateCollectionUseCase>((ref) {
  return CreateCollectionUseCase(
      collectionRepository: ref.read(collectionRepoProvider));
});

final createTagUsecaseProvider = Provider<CreateTagUseCase>((ref) {
  return CreateTagUseCase(
    tagRepository: ref.read(tagRepoProvider),
  );
});

final deleteCollectionCascadeUsecaseProvider =
    Provider<DeleteCollectionCascadeUseCase>((ref) {
  return DeleteCollectionCascadeUseCase(
    collectionRepository: ref.read(collectionRepoProvider),
  );
});

final deleteFileUsecaseProvider = Provider<DeleteFileUseCase>((ref) {
  return DeleteFileUseCase(
    fileRepository: ref.read(fileRepoProvider),
  );
});

final deleteTagUsecaseProvider = Provider<DeleteTagUseCase>((ref) {
  return DeleteTagUseCase(
    tagRepository: ref.read(tagRepoProvider),
  );
});

final findFilesUsecaseProvider = Provider<FindFilesUseCase>((ref) {
  return FindFilesUseCase(
    fileRepository: ref.read(fileRepoProvider),
  );
});

final getFileUsecaseProvider = Provider<GetFileUseCase>((ref) {
  return GetFileUseCase(
    fileRepository: ref.read(fileRepoProvider),
  );
});

final moveFileUsecaseProvider = Provider<MoveFileUseCase>((ref) {
  return MoveFileUseCase(
    fileRepository: ref.read(fileRepoProvider),
  );
});

final updateCollectionUsecaseProvider =
    Provider<UpdateCollectionUseCase>((ref) {
  return UpdateCollectionUseCase(
    collectionRepository: ref.read(collectionRepoProvider),
  );
});

final updateFileMetadataUsecaseProvider =
    Provider<UpdateFileMetadataUseCase>((ref) {
  return UpdateFileMetadataUseCase(
    fileRepository: ref.read(fileRepoProvider),
  );
});

final updateTagUsecaseProvider = Provider<UpdateTagUseCase>((ref) {
  return UpdateTagUseCase(
    tagRepository: ref.read(tagRepoProvider),
  );
});
