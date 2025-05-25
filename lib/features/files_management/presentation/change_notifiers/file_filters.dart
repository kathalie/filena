import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileFilterState {
  final bool showOnlyFavorites;
  final bool showSubfolderFiles;

  FileFilterState({
    required this.showOnlyFavorites,
    required this.showSubfolderFiles,
  });

  FileFilterState copyWith({
    bool? showOnlyFavorites,
    bool? showSubfolderFiles,
  }) {
    return FileFilterState(
      showOnlyFavorites: showOnlyFavorites ?? this.showOnlyFavorites,
      showSubfolderFiles: showSubfolderFiles ?? this.showSubfolderFiles,
    );
  }
}

class FileFilterNotifier extends StateNotifier<FileFilterState> {
  FileFilterNotifier()
      : super(
    FileFilterState(
      showOnlyFavorites: false,
      showSubfolderFiles: false,
    ),
  );

  void toggleShowOnlyFavorites() {
    state = state.copyWith(showOnlyFavorites: !state.showOnlyFavorites);
  }

  void toggleShowSubfolderFiles() {
    state = state.copyWith(showSubfolderFiles: !state.showSubfolderFiles);
  }
}

final filterStateProvider =
StateNotifierProvider<FileFilterNotifier, FileFilterState>((ref) {
  return FileFilterNotifier();
});
