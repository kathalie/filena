import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../organizing_assistant/api/providers.dart';
import '../../../organizing_assistant/presentation/change_notifiers/file_suggestions_in_folder.dart';
import '../../domain/entities/file_entity.dart';
import '../change_notifiers/filtered_files.dart';
import 'file_control.dart';
import 'file_row/file_row.dart';
import 'file_row/suggested_file_row.dart';

class FilesTable extends ConsumerWidget {
  const FilesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsync = ref.watch(fileSuggestionsInFolderProvider);
    final filesAsync = ref.watch(filteredFilesProvider);
    //
    // void toggleFileFavorite(FileEntity file) async {
    //   await FileRowPresenter(file).togglePrioritized();
    // }

    return suggestionsAsync.when(
      data: (suggestions) {
        return filesAsync.when(
          data: (files) {
            return DataTable(
              columns: _buildDataColumn(),
              rows: [
                ..._buildSuggestionRows(
                  suggestions,
                  (int fileId) async {},
                  ref,
                ),
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
    List<({int suggestionId, int colorHex, List<FileEntity> files})> suggestions,
    Future<void> Function(int) onToggleFavorite,
    WidgetRef ref,
  ) {
    final suggestionRows = <DataRow>[];
    final removeFileFromSuggestion =
        ref.read(folderSuggestionRepositoryProvider).removeFilesFromSuggestion;

    for (final suggestion in suggestions) {
      final rows = suggestion.files.map(
        (fileEntity) => SuggestedFileRow(
          fileEntity,
          onToggleFavorite,
          (int fileId) => IconButton(
            onPressed: () async => await removeFileFromSuggestion(suggestion.suggestionId, [fileId]),
            icon: const Icon(IconsConst.declineSuggestion),
          ),
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
            (int fileId) => FileControl(fileId),
          ).build(),
        )
        .toList();
  }

  List<DataColumn> _buildDataColumn() {
    final columnCaptions = [
      '',
      'Name',
      'Prioritized',
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
