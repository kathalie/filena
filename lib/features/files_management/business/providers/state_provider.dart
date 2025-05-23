import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../domain/entities/file_entity.dart';
import '../../domain/entities/folder_entity.dart';
import '../../domain/enums/folder_structure_mode.dart';
import '../../domain/structures/folder_tree.dart';
import '../repository_interfaces/file_repository.dart';
import '../repository_interfaces/folder_repository.dart';

class StateProvider {
  final FolderRepository _folderRepository;
  final FileRepository _fileRepository;

  final _filteredFiles = BehaviorSubject<List<FileEntity>>.seeded([]);
  final _showOnlyFavorites = BehaviorSubject<bool>.seeded(false);
  final _showSubfolderFiles = BehaviorSubject<bool>.seeded(false);
  final _selectedFolder = BehaviorSubject<FolderEntity?>.seeded(null);
  final _folderPath = BehaviorSubject<List<FolderEntity>>.seeded([]);
  final _folderStructure = BehaviorSubject<FolderTreeStructure>.seeded([]);
  final _currentFolderStructureMode =
      BehaviorSubject<FolderStructureMode>.seeded(
    FolderStructureMode.classified,
  );

  late final StreamSubscription _filterChangeSubscription;
  late final StreamSubscription _folderPathChangeSubscription;
  late final StreamSubscription _folderStructureChangeSubscription;

  StateProvider({
    required FolderRepository folderRepository,
    required FileRepository fileRepository,
  })  : _folderRepository = folderRepository,
        _fileRepository = fileRepository {
    _initialize();
  }

  Future<void> _initialize() async {
    _setupSubscriptions();
  }

  void _setupSubscriptions() {
    _filterChangeSubscription = Rx.combineLatest4(
      _fileRepository.fileChanges.startWith(null),
      _selectedFolder.distinct(),
      _showOnlyFavorites.distinct(),
      _showSubfolderFiles.distinct(),
      (_, selectedFolder, onlyFavorites, includeSubfolders) {
        return _fileRepository.getFilteredFiles(
          selectedFolder?.id,
          onlyFavorites,
          includeSubfolders,
        );
      },
    )
        .asyncMap((future) async => await future)
        .listen((filteredFiles) => _filteredFiles.add(filteredFiles));

    _folderStructureChangeSubscription = _folderRepository.folderChanges
        .startWith(null)
        .asyncMap((_) => _folderRepository.folderStructure)
        .listen((newStructure) => _folderStructure.add(newStructure));

    _folderPathChangeSubscription = Rx.combineLatest2(
      _folderRepository.folderChanges.startWith(null),
      _selectedFolder.distinct(),
      (_, newSelectedFolder) => newSelectedFolder,
    )
        .asyncMap((folder) => _folderRepository.getPathToFolder(folder?.id))
        .listen((newPath) => _folderPath.add(newPath));
  }

  Stream<List<FileEntity>> get filteredFiles => _filteredFiles.stream;

  Stream<bool> get showOnlyFavorites => _showOnlyFavorites.stream;

  Stream<bool> get showSubfolderFiles => _showSubfolderFiles.stream;

  Stream<FolderEntity?> get selectedFolder => _selectedFolder.stream;

  Stream<List<FolderEntity>> get folderPath => _folderPath.stream;

  Stream<FolderTreeStructure> get folderStructure => _folderStructure.stream;

  Stream<FolderStructureMode> get currentFolderStructureMode =>
      _currentFolderStructureMode.stream;

  void toggleShowOnlyFavourites() {
    _showOnlyFavorites.add(!_showOnlyFavorites.value);
  }

  void toggleShowSubfolderFiles() {
    _showSubfolderFiles.add(!_showSubfolderFiles.value);
  }

  void selectFolder(FolderEntity? newFolder) {
    _selectedFolder.add(newFolder);
  }

  void updateCurrentFolderStructureMode(FolderStructureMode newMode) {
    _currentFolderStructureMode.add(newMode);
  }

  void dispose() {
    _filteredFiles.close();
    _showOnlyFavorites.close();
    _showSubfolderFiles.close();
    _selectedFolder.close();
    _folderPath.close();
    _folderStructure.close();
    _filterChangeSubscription.cancel();
    _folderPathChangeSubscription.cancel();
    _folderStructureChangeSubscription.cancel();
  }
}
