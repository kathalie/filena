import 'package:get_it/get_it.dart';

import '../../../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../../../domain/structures/folder_tree.dart';

class FoldersTreeViewModel {
  final _folderRepository = GetIt.I.get<FolderRepository>();

  Stream<FolderTreeStructure> get folderStructure =>
      _folderRepository.folderStructure;
}
