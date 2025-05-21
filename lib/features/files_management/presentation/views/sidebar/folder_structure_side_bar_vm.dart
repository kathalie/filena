import 'package:rxdart/rxdart.dart';

enum FolderStructureType {
  classified('Classified'),
  unclassified('Unclassified');

  final String caption;

  const FolderStructureType(this.caption);
}

class FolderStructureSideBarViewModel {
  final _folderStructureType = BehaviorSubject<FolderStructureType>.seeded(
    FolderStructureType.classified,
  );
  Stream<FolderStructureType> get folderStructureType =>
      _folderStructureType.stream;

  onValueChanged(int newValue) {
    //TODO change folder structure
  }
}
