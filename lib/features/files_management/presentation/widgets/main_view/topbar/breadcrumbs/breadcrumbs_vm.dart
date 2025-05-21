import 'package:rxdart/rxdart.dart';

import '../../../../../domain/entities/folder_entity.dart';
import '../../../../../domain/structures/folder_tree.dart';


class BreadcrumbsViewModel {
  // Input
  final BehaviorSubject<FolderEntity> currentFolder;
  final BehaviorSubject<FolderTree> folderTree;

  // Output
  final _folderPath = BehaviorSubject<List<FolderEntity>>.seeded([]);
  Stream<List<FolderEntity>> get folderPath => _folderPath.stream;

  BreadcrumbsViewModel(this.currentFolder, this.folderTree) {
    currentFolder.listen((newCurrentFolder) {
      _folderPath.add(folderTree.value.folderPathTo(newCurrentFolder.id));
    });
  }

  void navigateToFolder(FolderEntity folder) {
    currentFolder.add(folder);
  }

  void dispose() {
    _folderPath.close();
  }
}