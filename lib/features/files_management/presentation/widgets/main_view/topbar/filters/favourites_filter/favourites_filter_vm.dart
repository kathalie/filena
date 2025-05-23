import 'package:get_it/get_it.dart';

import '../../../../../../business/repository_interfaces/user_choice_repository.dart';

class FavouritesFilterPresenter {
  final _userChoiceRepository = GetIt.I.get<UserChoiceRepository>();

  Stream<bool> get showOnlyFavourites =>
      _userChoiceRepository.showOnlyFavourites;

  void toggleShowOnlyFavourites() {
    _userChoiceRepository.toggleShowOnlyFavourites();
  }
}
