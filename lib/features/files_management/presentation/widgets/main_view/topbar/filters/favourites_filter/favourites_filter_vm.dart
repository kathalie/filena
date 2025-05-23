import 'package:get_it/get_it.dart';

import '../../../../../../business/providers/state_provider.dart';

class FavouritesFilterPresenter {
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<bool> get showOnlyFavourites =>
      _stateProvider.showOnlyFavorites;

  void toggleShowOnlyFavourites() {
    _stateProvider.toggleShowOnlyFavourites();
  }
}
