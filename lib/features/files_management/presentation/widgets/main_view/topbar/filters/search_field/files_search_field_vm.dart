import 'package:rxdart/rxdart.dart';

class FilesSearchFieldViewModel {
  final _searchQuery = BehaviorSubject<String>.seeded('');

  Stream<String> get searchQuery => _searchQuery.stream;

  void updateSearchQuery(String query) {
    _searchQuery.add(query);
  }

  void clearSearchQuery() {
    _searchQuery.add('');
  }
}