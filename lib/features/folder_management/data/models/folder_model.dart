import 'package:objectbox/objectbox.dart';

import '../../../file_management/data/models/file_in_folder_model.dart';
import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../../../file_management/data/models/file_model.dart';

@Entity()
class Folder {
  @Id()
  int id = 0;

  String name;

  bool isPending;

  @HnswIndex(dimensions: 10, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.floatVector)
  List<double> embeddings;

  ToOne<Folder> parentFolder = ToOne<Folder>();

  @Backlink('parentFolder')
  final nestedFolders = ToMany<Folder>();

  @Backlink('assignedFolder')
  final fileAssignments = ToMany<FileInFolder>();

  @Backlink('folder')
  final folderSuggestions = ToMany<FolderSuggestion>();

  Folder({
    required this.name,
    required this.embeddings,
    this.isPending = false,
  });

  // Helper functions

  List<Folder> get allNestedFolders {
    Set<Folder> collectNestedFolders(Folder folder) {
      return {
        ...folder.nestedFolders,
        ...folder.nestedFolders.expand(collectNestedFolders),
      };
    }

    final nestedFoldersIds = collectNestedFolders(this).toList();

    return nestedFoldersIds;
  }
}
