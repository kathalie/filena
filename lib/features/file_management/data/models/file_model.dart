import 'package:objectbox/objectbox.dart';

import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../../../folder_management/data/models/folder_model.dart';

@Entity()
class File {
  @Id()
  int obId = 0;

  @Unique()
  String id;

  @Unique()
  String hash;

  bool isPrioritized;

  int currentVersion;

  String mimeType;

  @HnswIndex(dimensions: 10, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.floatVector)
  List<double> embeddings;

  @Backlink('assignedFiles')
  final parentFolders = ToMany<Folder>();

  @Backlink('files')
  final folderSuggestions = ToMany<FolderSuggestion>();

  File({
    required this.id,
    required this.currentVersion,
    required this.hash,
    required this.mimeType,
    required this.isPrioritized,
    required this.embeddings,
  });
}
