import 'dart:async';
import 'package:rxdart/rxdart.dart';

class AddFilesViewModel {
  final selectedFiles = PublishSubject<List<String>>();
  late final StreamSubscription<void> _subscription;

  // final StateStream<SearchState> state;

  AddFilesViewModel() {
    _subscription = selectedFiles.listen((value) {

    });
  }

  void dispose() {
    _subscription.cancel();
    selectedFiles.close();
  }
}