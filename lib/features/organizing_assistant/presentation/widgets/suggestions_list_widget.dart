import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../change_notifiers/all_folder_suggestions.dart';
import '../change_notifiers/folder_suggestion_operations.dart';
import '../change_notifiers/selected_suggestion_id.dart';
import 'suggestion_card.dart';

class SuggestionsView extends ConsumerWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(allSuggestionsProvider);
    final setSelectedSuggestion =
        ref.read(selectedSuggestionProvider.notifier).update;

    return suggestions.when(
      data: (suggestions) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: _ConfirmAllButton(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = suggestions[index];

                  return GestureDetector(
                    onTap: () => setSelectedSuggestion(suggestion),
                    child: SuggestionCard(
                      suggestion: suggestion,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text('Failed to folder tree'),
      ),
    );
  }
}

class _ConfirmAllButton extends ConsumerWidget {
  const _ConfirmAllButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acceptAll =
        ref.read(folderSuggestionOperationsProvider.notifier).accept;

    return PlatformElevatedButton(
      onPressed: () => acceptAll,
      child: const Row(
        children: [
          Icon(
            Icons.thumb_up,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Text(
            'Accept all',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
