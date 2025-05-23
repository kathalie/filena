import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../business/providers/state_provider.dart';
import '../../../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../../../domain/entities/folder_entity.dart';
import '../../../../../../domain/structures/folder_tree.dart';

class FoldersTreePresenter {
  final _folderRepository = GetIt.I.get<FolderRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<FolderTreeStructure> get folderStructure =>
      _stateProvider.folderStructure;

  final _expandedFolders = BehaviorSubject<Set<int?>>.seeded({});
  Stream<Set<int?>> get expandedFolders => _expandedFolders.stream;

}
