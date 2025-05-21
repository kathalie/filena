import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../business/repository_interfaces/user_choice_repository.dart';
import '../../domain/enums/folder_structure_mode.dart';

class UserChoiceRepositoryImpl implements UserChoiceRepository {
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

  void dispose() {
    _currentFolderStructureMode.close();
  }
}
