import 'package:rxdart/rxdart.dart';

class PromptBarPresenter {
  final _promptTextSubject = BehaviorSubject<String>.seeded('');
  final _isVisibleSubject = BehaviorSubject<bool>.seeded(false);

  Stream<String> get promptText => _promptTextSubject.stream;
  Stream<bool> get isVisible => _isVisibleSubject.stream;

  void updatePrompt(String value) {
    _promptTextSubject.add(value);
  }

  void processPrompt() {
    // TODO process prompt
  }

  void toggleVisibility() {
    _isVisibleSubject.add(!_isVisibleSubject.value);
  }

  void dispose() {
    _promptTextSubject.close();
    _isVisibleSubject.close();
  }
}