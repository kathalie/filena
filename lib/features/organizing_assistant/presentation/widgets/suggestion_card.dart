import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../domain/entities/folder_suggestion_entity.dart';
import '../change_notifiers/folder_suggestion_operations.dart';
import '../change_notifiers/selected_suggestion_id.dart';
import '../presenters/folder_suggestion_presenter.dart';

class SuggestionCard extends ConsumerWidget {
  final FolderSuggestionPresenter _presenter;

  SuggestionCard({required FolderSuggestionEntity suggestion, super.key})
      : _presenter = FolderSuggestionPresenter(suggestion);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSuggestion = ref.read(selectedSuggestionProvider);
    final isSelected = selectedSuggestion?.id == _presenter.suggestionId;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color(_presenter.colorHex).withOpacity(isSelected ? 0.7 : 1.0),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: isSelected
            ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _SuggestionContent(
                _presenter.title, _presenter.message, isSelected),
          ),
          _SuggestionControls(_presenter.suggestionId),
        ],
      ),
    );
  }
}

class _SuggestionContent extends StatelessWidget {
  final String _title;
  final String _message;
  final bool _isSelected;

  const _SuggestionContent(this._title, this._message, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: _isSelected ? FontWeight.bold : FontWeight.w500,
            color: _isSelected ? Colors.black87 : Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            _message,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _isSelected ? Colors.black87 : Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class _SuggestionControls extends ConsumerWidget {
  final int _suggestionId;

  const _SuggestionControls(this._suggestionId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accept = ref.read(folderSuggestionOperationsProvider.notifier).accept;
    final decline =
        ref.read(folderSuggestionOperationsProvider.notifier).decline;

    return Column(
      children: [
        IconButton(
          icon: const Icon(
            IconsConst.acceptSuggestion,
          ),
          onPressed: () => accept(_suggestionId),
        ),
        IconButton(
          icon: const Icon(
            IconsConst.declineSuggestion,
          ),
          onPressed: () => decline(_suggestionId),
        ),
      ],
    );
  }
}
