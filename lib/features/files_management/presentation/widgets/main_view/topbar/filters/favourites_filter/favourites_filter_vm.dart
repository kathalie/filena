import 'package:get_it/get_it.dart';

import '../../../../../../business/providers/state_provider.dart';
import '../../../../../../business/repository_interfaces/user_choice_repository.dart';

class FavouritesFilterPresenter {
  final _userChoiceRepository = GetIt.I.get<UserChoiceRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<bool> get showOnlyFavourites =>
      _stateProvider.showOnlyFavorites;

  void toggleShowOnlyFavourites() {
    _stateProvider.toggleShowOnlyFavourites();
  }
}
