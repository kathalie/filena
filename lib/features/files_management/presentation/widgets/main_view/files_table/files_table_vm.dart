import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../mock/MockFileRepository.dart';
import '../../../../business/repository_interfaces/user_choice_repository.dart';
import '../../../../domain/entities/file_entity.dart';

class FilesTablePresenter {
  final _fileRepository = MockFileRepository();
  final _userChoiceRepository = GetIt.I.get<UserChoiceRepository>();

  Stream<List<FileEntity>> get files => Rx.combineLatest3(
        _fileRepository.getMockedFilesStream(),
        _userChoiceRepository.showSubfolderFiles,
        _userChoiceRepository.showOnlyFavourites,
        (
          List<FileEntity> files,
          bool includeSubfolders,
          bool onlyFavorites,
        ) {
          var filteredFiles = files;

          //TODO method for getting
          // 1. files from a specified folder (if null - all).
          // 2. bool recursive - if true, then from all subfolders as well
          // ! listen to changes in DB

          //TODO implement all files from subfolders filtration
          // filteredFiles = includeSubfolders
          //     ? files
          //     : files.where((file) => !file.isFromSubfolder).toList();

          if (onlyFavorites) {
            filteredFiles =
                filteredFiles.where((file) => file.isFavourite).toList();
          }

          return filteredFiles;
        },
      );
}
