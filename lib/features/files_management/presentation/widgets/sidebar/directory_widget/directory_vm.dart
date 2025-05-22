import 'package:rxdart/rxdart.dart';

typedef DirectoryCharacteristics = ({
  String name,
  bool hasNestedFolders,
  bool isRoot,
});

class DirectoryViewModel {
  final BehaviorSubject<bool> isExpanded;

  final DirectoryCharacteristics _directoryCharacteristics;

  DirectoryCharacteristics get characteristics => _directoryCharacteristics;

  DirectoryViewModel({
    required bool initialIsExpanded,
    required DirectoryCharacteristics characteristics,
  })  : isExpanded = BehaviorSubject<bool>.seeded(initialIsExpanded),
        _directoryCharacteristics = characteristics;

  void toggleIsExpanded() {
    isExpanded.add(!isExpanded.value);
  }

  void dispose() {
    isExpanded.close();
  }
}
