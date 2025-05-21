import 'package:rxdart/rxdart.dart';

import '../../../../domain/entities/folder_entity.dart';

class FolderControlViewModel {
  // Input
  final BehaviorSubject<FolderEntity> currentFolder;

  FolderControlViewModel(this.currentFolder);
}