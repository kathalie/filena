import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/analysed_prompt_entity.dart';

class AnalysedPromptNotifier
    extends StateNotifier<List<AnalysedPromptEntity>> {
  final Ref ref;

  AnalysedPromptNotifier(this.ref) : super([]);

  void update(List<AnalysedPromptEntity> results) {
    state = results;
  }
}

final analysedPromptProvider =
StateNotifierProvider<AnalysedPromptNotifier, List<AnalysedPromptEntity>>(
        (ref) {
      return AnalysedPromptNotifier(ref);
    });
