import 'dart:async';

import '../../../../objectbox.g.dart';
import '../../../files_management/data/models/file_model.dart';
import '../../../folders_management/data/models/folder_model.dart';
import '../../common/helpers/random_color_generator.dart';
import '../datasource_interfaces/datasource.dart';
import '../dto/folder_suggestion_dto.dart';
import '../models/folder_suggestion_model.dart';
import '../translators/to_dto.dart';

class FolderSuggestionDatasourceLocal implements FolderSuggestionDatasource {
  //TODO come up with proper communication between features
  final Store _store;
  late final _folderSuggestionBox = _store.box<FolderSuggestion>();
  late final _fileBox = _store.box<File>();
  late final _folderBox = _store.box<Folder>();

  FolderSuggestionDatasourceLocal(Store store): _store = store;

  @override
  Stream get suggestionsChanges => _folderSuggestionBox.query().watch();

  @override
  Future<List<FolderSuggestionDto>> get allSuggestions async {
    final suggestions = await _folderSuggestionBox.getAllAsync();

    return suggestions.map((suggestions) => suggestions.toDto()).toList();
  }

  @override
  Future<void> generateSuggestion({
    required String suggestedFolder,
    required List<double> folderEmbeddings,
    required String filesDescription,
    required List<double> filesDescriptionEmbeddings,
  }) async {
    final nearestFolderQuery = _folderBox
        .query(
          Folder_.embeddings
              .nearestNeighborsF32(folderEmbeddings, 5),
        )
        .build();

    final nearestFilesQuery = _fileBox
        .query(
          File_.embeddings
              .nearestNeighborsF32(filesDescriptionEmbeddings, 5),
        )
        .build();

    final nearestFolders = nearestFolderQuery.findWithScores();
    final nearestFiles = nearestFilesQuery.findWithScores();

    //TODO decide whether to create a folder or use the first one

    for (final nearestFolder in nearestFolders) {
      print(
          "Folder: ${nearestFolder.object.name}, distance: ${nearestFolder.score}");
    }

    await _saveSuggestion(
      nearestFolders.first.object,
      nearestFiles.map((file) => file.object).toList(),
    );
  }

  Future<void> _saveSuggestion(Folder folder, List<File> files) async {
    //TODO explanation
    final newSuggestionModel = FolderSuggestion(
      colorHex: ColorGenerator.generateContrastingRandomColor(),
      explanation: '',
    );

    newSuggestionModel.folder.target = folder;
    newSuggestionModel.files.addAll(files);

    await _folderSuggestionBox.putAsync(newSuggestionModel);
  }

  @override
  Future<void> acceptSuggestion(int suggestionId) {
    // TODO: implement acceptSuggestion
    throw UnimplementedError();
  }

  @override
  Future<void> declineSuggestion(int suggestionId) {
    // TODO: implement declineSuggestion
    throw UnimplementedError();
  }

  @override
  Future<void> removeFilesFromSuggestion(
      FolderSuggestionDto suggestion, List<int> fileIds) {
    // TODO: implement removeFilesFromSuggestion
    throw UnimplementedError();
  }

  @override
  Future<void> acceptAll() {
    // TODO: implement acceptAll
    throw UnimplementedError();
  }
}

