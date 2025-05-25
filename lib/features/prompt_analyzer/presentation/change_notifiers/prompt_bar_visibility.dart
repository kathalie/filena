import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromptBarVisibilityNotifier extends StateNotifier<bool> {
  PromptBarVisibilityNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final promptBarVisibilityProvider =
StateNotifierProvider<PromptBarVisibilityNotifier, bool>((ref) {
  return PromptBarVisibilityNotifier();
});