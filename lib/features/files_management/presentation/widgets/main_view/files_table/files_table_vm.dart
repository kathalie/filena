import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../../../business/providers/state_provider.dart';
import '../../../../business/repository_interfaces/file_repository.dart';
import '../../../../domain/entities/file_entity.dart';

class FilesTablePresenter {
  final _fileRepository = GetIt.I.get<FileRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<List<FileEntity>> get files => _stateProvider.filteredFiles;
}
