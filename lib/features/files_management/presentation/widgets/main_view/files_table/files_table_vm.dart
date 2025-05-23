import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../../../business/repository_interfaces/file_repository.dart';
import '../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../domain/entities/file_entity.dart';
import '../../../../domain/entities/folder_entity.dart';

class FilesTablePresenter {
  final _fileRepository = GetIt.I.get<FileRepository>();

  Stream<List<FileEntity>> get files => _fileRepository.filteredFiles;

  //TODO move this logic somewhere
  // >>>
  final _folderRepository = GetIt.I.get<FolderRepository>();
  late final StreamSubscription<FolderEntity?> _selectedFolderSubscription;

  _initSubscription() {
    _selectedFolderSubscription = _folderRepository.selectedFolder.listen(
          (newSelectedFolder) =>
          _fileRepository.setParentFolderFilter(newSelectedFolder?.id),
    );
  }
  // <<<

  FilesTablePresenter() {
    _initSubscription();
  }

  void dispose() {
    _selectedFolderSubscription.cancel();
  }
}
