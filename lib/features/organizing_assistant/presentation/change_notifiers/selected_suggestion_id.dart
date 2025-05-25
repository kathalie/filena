import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedSuggestionNotifier extends StateNotifier<int?> {
  SelectedSuggestionNotifier() : super(null);

  void update(int? suggestionId) {
    state = suggestionId;
  }

  void accept() {
    //TODO accept suggestion
  }

  void decline() {
    //TODO decline suggestion
  }
}

final selectedSuggestionIdProvider =
StateNotifierProvider<SelectedSuggestionNotifier, int?>((ref) {
  return SelectedSuggestionNotifier();
});