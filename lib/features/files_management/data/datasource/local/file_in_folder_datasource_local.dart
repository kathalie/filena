import 'package:get_it/get_it.dart';

import '../../../../../core/db/objectbox.dart';
import '../../../../../core/errors/file_exception.dart';
import '../../../../../core/errors/folder_exception.dart';
import '../../../../../objectbox.g.dart';
import '../../models/file_model.dart';
import '../../models/folder_model.dart';
import '../dto/file_dto.dart';
import '../file_in_folder_datasource.dart';

class FileInFolderDatasourceLocal implements FileInFolderDatasource {
  final _store = GetIt.I<ObjectBox>().store;
  final _fileBox = GetIt.I<ObjectBox>().store.box<File>();
  final _folderBox = GetIt.I<ObjectBox>().store.box<Folder>();

  @override
  Future<void> assignFileToFolder(int fileId, int folderId) async {
    assign(Store store, int objectId) {
      final folder = store.box<Folder>().get(folderId);
      final file = store.box<File>().get(objectId);

      if (folder == null) {
        throw FolderException.folderDoesNotExist(
          title: 'Failed to assign file to a folder',
        );
      }

      if (file == null) {
        throw FileException.fileDoesNotExist(
          title: 'Failed to assign file to a folder',
        );
      }

      final updatedFile = file..parentFolders.add(folder);

      store.box<File>().put(updatedFile);
    }

    await _store.runInTransactionAsync(
      TxMode.write,
      assign,
      fileId,
    );
  }

  @override
  Future<List<FileDto>> getFilesFromFolder(int folderId) async {
    final folder = _folderBox.get(folderId);

    if (folder == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Failed to retrieve files from this folder.',
      );
    }

    final filesInFolder = folder.assignedFiles;

    return filesInFolder.map((file) {
      return FileDto.fromModel(file);
    }).toList();
  }
}
