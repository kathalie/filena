import 'dart:async';

import '../../../../core/errors/folder_exception.dart';
import '../../../../objectbox.g.dart';
import '../../../file_management/data/models/file_model.dart';
import '../../../folder_management/data/models/folder_model.dart';
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

  FolderSuggestionDatasourceLocal(Store store) : _store = store;

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
          Folder_.embeddings.nearestNeighborsF32(folderEmbeddings, 1),
        )
        .build();

    final nearestFilesQuery = _fileBox
        .query(
          File_.embeddings.nearestNeighborsF32(filesDescriptionEmbeddings, 3),
        )
        .build();

    final nearestFolderWithScores = nearestFolderQuery.findWithScores().first;
    final nearestFilesWithScores = nearestFilesQuery.findWithScores();

    //TODO decide whether to create a folder or use the first one
    print(
        "Folder: ${nearestFolderWithScores.object.name}, distance: ${nearestFolderWithScores.score}");

    for (final fileWithScores in nearestFilesWithScores) {
      print(
          "File: ${fileWithScores.object.id}, distance: ${fileWithScores.score}");
    }

    const threshold = 0.1;

    final targetFiles =
        nearestFilesWithScores.map((file) => file.object).toList();

    final targetFolder = nearestFolderWithScores.score < threshold
        ? nearestFolderWithScores.object
        : await _createPendingFolder(
            suggestedFolder,
            folderEmbeddings,
            parentFolder: nearestFolderWithScores.object,
          );

    await _saveSuggestion(targetFolder, targetFiles);
  }

  Future<Folder> _createPendingFolder(
    String name,
    List<double> embeddings, {
    required Folder parentFolder,
  }) async {
    final folderModel = Folder(
      name: name,
      isPending: true,
      embeddings: embeddings,
    );

    folderModel.parentFolder.target = parentFolder;

    final newFolderId = await _folderBox.putAsync(folderModel);
    final newFolder = await _folderBox.getAsync(newFolderId);

    if (newFolder == null) {
      throw FolderException.failedToCreateFolder(folderName: 'name');
    }

    return newFolder;
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
