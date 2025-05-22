import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../business/repository_interfaces/user_choice_repository.dart';
import '../../domain/enums/folder_structure_mode.dart';

class UserChoiceRepositoryImpl implements UserChoiceRepository {
  //MARK: Folder structure mode
  final _currentFolderStructureMode =
      BehaviorSubject<FolderStructureMode>.seeded(
    FolderStructureMode.classified,
  );

  @override
  Stream<FolderStructureMode> get currentFolderStructureMode =>
      _currentFolderStructureMode.stream;

  @override
  void updateCurrentFolderStructureMode(FolderStructureMode newMode) {
    _currentFolderStructureMode.add(newMode);
  }

  //MARK: File filters
  final _showOnlyFavourites = BehaviorSubject<bool>.seeded(false);
  final _showSubfolderFiles = BehaviorSubject<bool>.seeded(false);

  @override
  Stream<bool> get showOnlyFavourites => _showOnlyFavourites.stream;

  @override
  Stream<bool> get showSubfolderFiles => _showSubfolderFiles.stream;

  @override
  void toggleShowOnlyFavourites() {
    _showOnlyFavourites.add(!_showOnlyFavourites.value);
  }

  @override
  void toggleShowSubfolderFiles() {
    _showSubfolderFiles.add(!_showSubfolderFiles.value);
  }

  //MARK: disposal
  void dispose() {
    _currentFolderStructureMode.close();
  }
}
