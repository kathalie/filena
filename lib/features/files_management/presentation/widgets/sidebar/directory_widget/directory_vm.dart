import 'package:rxdart/rxdart.dart';

import '../../../../domain/structures/folder_tree.dart';

class DirectoryViewModel {
  final BehaviorSubject<bool> isExpanded;

  final String _directoryName;

  String get directoryName => _directoryName;

  final bool _hasNestedFolders;

  bool get hasNestedFolders => _hasNestedFolders;

  DirectoryViewModel({
    required String name,
    required bool hasNestedFolders,
    required bool initialIsExpanded,
  })  : isExpanded = BehaviorSubject<bool>.seeded(initialIsExpanded),
        _directoryName = name,
        _hasNestedFolders = hasNestedFolders;

  void toggleIsExpanded() {
    isExpanded.add(!isExpanded.value);
  }

  void dispose() {
    isExpanded.close();
  }
}
