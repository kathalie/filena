import 'dart:async';

import '../../../../core/errors/folder_exception.dart';
import '../../../../core/errors/folder_suggestion_exception.dart';
import '../../../../objectbox.g.dart';
import '../../../file_management/data/models/file_in_folder_model.dart';
import '../../../file_management/data/models/file_model.dart';
import '../../../folder_management/data/models/folder_model.dart';
import '../../common/helpers/random_color_generator.dart';
import '../datasource_interfaces/datasource.dart';
import '../dto/folder_suggestion_dto.dart';
import '../models/folder_suggestion_model.dart';
import '../translators/to_dto.dart';

class FolderSuggestionDatasourceLocal implements FolderSuggestionDatasource {
  final Store _store;
  late final _folderSuggestionBox = _store.box<FolderSuggestion>();
  late final _fileBox = _store.box<File>();
  late final _folderBox = _store.box<Folder>();
  late final _fileInFolderBox = _store.box<FileInFolder>();

  FolderSuggestionDatasourceLocal(Store store) : _store = store;

  @override
  Stream get suggestionsChanges => _folderSuggestionBox.query().watch();

  @override
  Future<List<FolderSuggestionDto>> get allSuggestions async {
    final suggestions = _folderSuggestionBox.getAll();

    return suggestions.map((suggestions) => suggestions.toDto()).toList();
  }

  @override
  Future<void> generateSuggestion({
    required String suggestedFolder,
    required List<double> folderEmbeddings,
    required String filesDescription,
    required List<double> filesDescriptionEmbeddings,
    required String explanation,
  }) async {
    final targetFiles = await _nearestFiles(filesDescriptionEmbeddings);

    if (targetFiles.isEmpty) return;

    final targetFolder =
        await _nearestFolder(folderEmbeddings, suggestedFolder);

    await _saveSuggestion(targetFolder, targetFiles, explanation);
  }

  Future<List<File>> _nearestFiles(
    List<double> filesDescriptionEmbeddings,
  ) async {
    const threshold = 0.5;

    final numberOfFiles = _fileBox.count();
    final nearestFilesQuery = _fileBox
        .query(
          File_.embeddings.nearestNeighborsF32(
            filesDescriptionEmbeddings,
            numberOfFiles,
          ),
        )
        .build();

    // Select only "closest" files based on a threshold
    final nearestFilesWithScores = nearestFilesQuery
        .findWithScores()
        .where((value) => value.score < threshold);

    for (final fileWithScores in nearestFilesWithScores) {
      print(
          "File: ${fileWithScores.object.id}, distance: ${fileWithScores.score}");
    }

    return nearestFilesWithScores.map((file) => file.object).toList();
  }

  Future<Folder> _nearestFolder(
      List<double> folderEmbeddings, String suggestedFolder) async {
    const threshold = 0.1;

    final nearestFolderQuery = _folderBox
        .query(
          Folder_.isPending
              .equals(false)
              .and(Folder_.embeddings.nearestNeighborsF32(folderEmbeddings, 1)),
        )
        .build();

    final nearestFoldersWithScores = nearestFolderQuery.findWithScores();

    // If no embeddings found, then create a pending folder in a root
    if (nearestFoldersWithScores.isEmpty) {
      final rootFolder = await _folderBox
          .query(Folder_.parentFolder.equals(0))
          .build()
          .findFirstAsync();

      return await _createPendingFolder(
        suggestedFolder,
        folderEmbeddings,
        parentFolder: rootFolder!,
      );
    }

    final nearestFolderWithScores = nearestFoldersWithScores.first;

    print(
        "Folder: ${nearestFolderWithScores.object.name}, distance: ${nearestFolderWithScores.score}");

    // Choose a folder if it is "close enough"
    if (nearestFolderWithScores.score < threshold) {
      return nearestFolderWithScores.object;
    }

    // Create a new folder in the closest existing
    return await _createPendingFolder(
      suggestedFolder,
      folderEmbeddings,
      parentFolder: nearestFolderWithScores.object,
    );
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

    return _store.runInTransaction(TxMode.write,
        () {
      final newFolderId = _folderBox.put(folderModel);
      final newFolder = _folderBox.get(newFolderId);

      if (newFolder == null) {
        throw FolderException.failedToCreateFolder(folderName: 'name');
      }

      return newFolder;
    });
  }

  Future<void> _saveSuggestion(
    Folder folder,
    List<File> files,
    String explanation,
  ) async {
    final newSuggestionModel = FolderSuggestion(
      colorHex: ColorGenerator.generateContrastingRandomColor(),
      explanation: explanation,
    );

    newSuggestionModel.folder.target = folder;
    newSuggestionModel.files.addAll(files);

    _folderSuggestionBox.put(newSuggestionModel);
  }

  @override
  Future<void> acceptAll() async {
    _store.runInTransaction(
      TxMode.write,
      () {
        final allFolderSuggestions = _folderSuggestionBox.getAll();

        for (final suggestion in allFolderSuggestions) {
          _acceptSuggestion(suggestion);
        }
      },
    );
  }

  @override
  Future<void> acceptSuggestion(int suggestionId) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
        final folderSuggestion = _folderSuggestionBox.get(suggestionId);

        if (folderSuggestion == null) {
          throw FolderSuggestionException.folderSuggestionDoesNotExist(
            title: 'Failed to accept suggestion',
          );
        }

        _acceptSuggestion(folderSuggestion);
      },
    );
  }

  Future<void> _acceptSuggestion(FolderSuggestion folderSuggestion) async {
    final folder = folderSuggestion.folder.target;

    if (folder == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Failed to accept suggestion',
      );
    }

    // Accept generated folders (not pending anymore)
    folder.isPending = false;

    // Assign suggested files to a suggested folder
    for (final file in folderSuggestion.files) {
      final fileInFolder = FileInFolder();
      fileInFolder.assignedFile.target = file;
      fileInFolder.assignedFolder.target = folder;
      _fileInFolderBox.put(fileInFolder);
    }

    _folderBox.put(folder);

    // Remove a suggestion
    _folderSuggestionBox.remove(folderSuggestion.id);
  }

  @override
  Future<void> declineSuggestion(int suggestionId) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
        final folderSuggestion = _folderSuggestionBox.get(suggestionId);

        if (folderSuggestion == null) {
          throw FolderSuggestionException.folderSuggestionDoesNotExist(
            title: 'Failed to decline suggestion',
          );
        }

        final folder = folderSuggestion.folder.target;

        if (folder == null) {
          throw FolderException.folderDoesNotExist(
            title: 'Failed to decline suggestion',
          );
        }

        // Remove a generated folder
        if (folder.isPending) {
          _folderBox.remove(folder.id);
        }

        // Remove a suggestion
        _folderSuggestionBox.remove(folderSuggestion.id);
      },
    );
  }

  @override
  Future<void> removeFilesFromSuggestion(
    int suggestionId,
    List<int> fileIds,
  ) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
        final folderSuggestion = _folderSuggestionBox.get(suggestionId);

        if (folderSuggestion == null) {
          throw FolderSuggestionException.folderSuggestionDoesNotExist(
            title: 'Failed to remove files from suggestion',
          );
        }

        folderSuggestion.files.removeWhere((file) => fileIds.contains(file.id));

        if (folderSuggestion.files.isEmpty) {
          _folderSuggestionBox.remove(folderSuggestion.id);

          return;
        }

        _folderSuggestionBox.put(folderSuggestion);
      },
    );
  }
}
