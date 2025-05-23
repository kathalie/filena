import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../domain/entities/file_entity.dart';
import '../../domain/entities/folder_entity.dart';
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

  late final StreamSubscription _filterChangeSubscription;
  late final StreamSubscription _folderPathChangeSubscription;
  late final StreamSubscription _folderStructureChangeSubscription;

  StateProvider({
    required FolderRepository folderRepository,
    required FileRepository fileRepository,
  })  : _folderRepository = folderRepository,
        _fileRepository = fileRepository {
    _initFilterChangeSubscription();
    _loadInitialFilteredFiles();

    _initFolderStructureChangeSubscription();
    _loadInitialFolderStructure();

    _initFolderPathChange();
    _loadInitialFolderPath();
  }

  void _initFilterChangeSubscription() {
    _filterChangeSubscription = Rx.combineLatest4(
      _fileRepository.fileChanges,
      _selectedFolder,
      _showOnlyFavorites,
      _showSubfolderFiles,
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
  }

  Future<void> _loadInitialFilteredFiles() async {
    final initialFiles = await _fileRepository.getFilteredFiles(
      _selectedFolder.value?.id,
      _showOnlyFavorites.value,
      _showSubfolderFiles.value,
    );

    _filteredFiles.add(initialFiles);
  }

  void _initFolderStructureChangeSubscription() {
    _folderStructureChangeSubscription =
        _folderRepository.folderChanges.listen((_) async {
      final newFolderStructure = await _folderRepository.folderStructure;

      _folderStructure.add(newFolderStructure);
    });
  }

  Future<void> _loadInitialFolderStructure() async {
    final initialFolderStructure = await _folderRepository.folderStructure;

    _folderStructure.add(initialFolderStructure);
  }

  void _initFolderPathChange() {
    _folderPathChangeSubscription = Rx.combineLatest2(
      _folderRepository.folderChanges,
      _selectedFolder,
      (_, newSelectedFolder) => newSelectedFolder,
    ).listen((newSelectedFolder) async {
      final newFolderPath =
          await _folderRepository.getPathToFolder(newSelectedFolder?.id);

      _folderPath.add(newFolderPath);
    });
  }

  Future<void> _loadInitialFolderPath() async {
    final selectedFolder = _selectedFolder.value;
    final initialFolderPath =
        await _folderRepository.getPathToFolder(selectedFolder?.id);

    _folderPath.add(initialFolderPath);
  }

  Stream<List<FileEntity>> get filteredFiles =>
      _filteredFiles.stream.distinct();

  Stream<bool> get showOnlyFavorites => _showOnlyFavorites.stream.distinct();

  Stream<bool> get showSubfolderFiles => _showSubfolderFiles.stream.distinct();

  Stream<FolderEntity?> get selectedFolder => _selectedFolder.stream.distinct();

  Stream<List<FolderEntity>> get folderPath => _folderPath.stream.distinct();

  Stream<FolderTreeStructure> get folderStructure =>
      _folderStructure.stream.distinct();

  void toggleShowOnlyFavourites() {
    _showOnlyFavorites.add(!_showOnlyFavorites.value);
  }

  void toggleShowSubfolderFiles() {
    _showSubfolderFiles.add(!_showSubfolderFiles.value);
  }

  void selectFolder(FolderEntity? newFolder) {
    _selectedFolder.add(newFolder);
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
