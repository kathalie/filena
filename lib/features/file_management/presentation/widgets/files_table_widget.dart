import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../organizing_assistant/presentation/change_notifiers/file_suggestions_in_folder.dart';
import '../../domain/entities/file_entity.dart';
import '../change_notifiers/filtered_files.dart';
import 'file_row.dart';

class FilesTable extends ConsumerWidget {
  const FilesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsync = ref.watch(fileSuggestionsInFolderProvider);
    final filesAsync = ref.watch(filteredFilesProvider);
    //
    // void toggleFileFavorite(FileEntity file) async {
    //   await FileRowPresenter(file).toggleFavourite();
    // }

    return suggestionsAsync.when(
      data: (suggestions) {
        return filesAsync.when(
          data: (files) {
            return DataTable(
              columns: _buildDataColumn(),
              rows: [
                ..._buildSuggestionRows(
                    suggestions, (int fileId) async {}),
                //TODO update file state
                ..._buildFileRows(files, (int fileId) async {}),
                //TODO update file state
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text('Error loading files: $error'),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error loading suggestions: $error'),
    );
  }

  List<DataRow> _buildSuggestionRows(
      List<({int colorHex, List<FileEntity> files})> suggestions,
      Future<void> Function(int) onToggleFavorite) {
    final suggestionRows = <DataRow>[];

    for (final suggestion in suggestions) {
      final rows = suggestion.files.map(
        (fileEntity) => SuggestionFileRow(
          fileEntity,
          onToggleFavorite,
          suggestion.colorHex,
        ).build(),
      );
      suggestionRows.addAll(rows);
    }

    return suggestionRows;
  }

  List<DataRow> _buildFileRows(
    List<FileEntity> files,
      Future<void> Function(int) onToggleFavorite,
  ) {
    return files
        .map(
          (fileEntity) => FileRow(
            fileEntity,
            onToggleFavorite,
          ).build(),
        )
        .toList();
  }

  List<DataColumn> _buildDataColumn() {
    final columnCaptions = [
      '',
      'Name',
      'Favourite',
      'Size',
      'Last modified',
      'Created',
      '',
    ];

    return columnCaptions
        .map(
          (caption) => DataColumn(
            label: Expanded(child: Text(caption)),
          ),
        )
        .toList();
  }
}
