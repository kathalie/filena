import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/library_management/business/usecases/add_file.dart';
import '../../../features/library_management/business/usecases/create_collection.dart';
import '../../../features/library_management/business/usecases/create_tag.dart';
import '../../../features/library_management/business/usecases/delete_collection_cascade.dart';
import '../../../features/library_management/business/usecases/delete_file.dart';
import '../../../features/library_management/business/usecases/delete_tag.dart';
import '../../../features/library_management/business/usecases/find_files.dart';
import '../../../features/library_management/business/usecases/get_categories.dart';
import '../../../features/library_management/business/usecases/get_collections_within_collection.dart';
import '../../../features/library_management/business/usecases/get_files_within_collection.dart';
import '../../../features/library_management/business/usecases/move_file.dart';
import '../../../features/library_management/business/usecases/update_collection.dart';
import '../../../features/library_management/business/usecases/update_file_metadata.dart';
import '../../../features/library_management/business/usecases/update_tag.dart';
import '../repositories/repositories_di.dart';

part 'library_management_usecases_di.g.dart';

@riverpod
AddFileUseCase addFileUsecase(AddFileUsecaseRef ref) {
  return AddFileUseCase(
    fileRepository: ref.watch(fileRepositoryProvider),
  );
}

@riverpod
CreateCollectionUseCase createCollectionUsecase(
  CreateCollectionUsecaseRef ref,
) {
  return CreateCollectionUseCase(
    collectionRepository: ref.watch(collectionRepositoryProvider),
  );
}

@riverpod
CreateTagUseCase createTagUsecase(
  CreateTagUsecaseRef ref,
) {
  return CreateTagUseCase(
    tagRepository: ref.watch(tagRepositoryProvider),
  );
}

@riverpod
DeleteCollectionCascadeUseCase deleteCollectionCascadeUsecase(
  DeleteCollectionCascadeUsecaseRef ref,
) {
  return DeleteCollectionCascadeUseCase(
    collectionRepository: ref.watch(collectionRepositoryProvider),
  );
}

@riverpod
DeleteFileUseCase deleteFileUsecase(
  DeleteFileUsecaseRef ref,
) {
  return DeleteFileUseCase(
    fileRepository: ref.watch(fileRepositoryProvider),
  );
}

@riverpod
DeleteTagUseCase deleteTagUsecase(
  DeleteTagUsecaseRef ref,
) {
  return DeleteTagUseCase(
    tagRepository: ref.watch(tagRepositoryProvider),
  );
}

@riverpod
FindFilesUseCase findFilesUsecase(
  FindFilesUsecaseRef ref,
) {
  return FindFilesUseCase(
    fileRepository: ref.watch(fileRepositoryProvider),
    fileVersionRepository: ref.watch(fileVersionRepositoryProvider),
  );
}

@riverpod
GetCategoriesUseCase getCategoriesUseCase(GetCategoriesUseCaseRef ref) {
  return GetCategoriesUseCase(
    categoryRepository: ref.watch(categoryRepositoryProvider),
  );
}

@riverpod
GetFilesWithinCollectionUseCase getFilesWithinCollectionUsecase(
  GetFilesWithinCollectionUsecaseRef ref,
) {
  return GetFilesWithinCollectionUseCase(
    fileRepository: ref.watch(fileRepositoryProvider),
  );
}

@riverpod
GetCollectionsWithinCollectionUseCase getCollectionsWithinCollectionUsecase(
  GetCollectionsWithinCollectionUsecaseRef ref,
) {
  return GetCollectionsWithinCollectionUseCase(
    collectionRepository: ref.watch(collectionRepositoryProvider),
  );
}

@riverpod
MoveFileUseCase moveFileUsecase(
  MoveFileUsecaseRef ref,
) {
  return MoveFileUseCase(
    fileRepository: ref.watch(fileRepositoryProvider),
  );
}

@riverpod
UpdateCollectionUseCase updateCollectionUsecase(
  UpdateCollectionUsecaseRef ref,
) {
  return UpdateCollectionUseCase(
    collectionRepository: ref.watch(collectionRepositoryProvider),
  );
}

@riverpod
UpdateFileMetadataUseCase updateFileMetadataUsecase(
  UpdateFileMetadataUsecaseRef ref,
) {
  return UpdateFileMetadataUseCase(
    fileRepository: ref.watch(fileRepositoryProvider),
  );
}

@riverpod
UpdateTagUseCase updateTagUsecase(
  UpdateTagUsecaseRef ref,
) {
  return UpdateTagUseCase(
    tagRepository: ref.watch(tagRepositoryProvider),
  );
}
