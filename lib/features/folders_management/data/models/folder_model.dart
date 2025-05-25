import 'package:objectbox/objectbox.dart';

import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../../../files_management/data/models/file_model.dart';

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

  final assignedFiles = ToMany<File>();

  @Backlink('folder')
  final folderSuggestions = ToMany<FolderSuggestion>();

  Folder({
    required this.name,
    required this.embeddings,
    this.isPending = false,
  });
}
