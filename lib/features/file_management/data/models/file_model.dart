import 'package:objectbox/objectbox.dart';

import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../../../folder_management/data/models/folder_model.dart';

@Entity()
class File {
  @Id()
  int id = 0;

  @Unique()
  String hash;

  bool isFavourite;

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
    required this.currentVersion,
    required this.hash,
    required this.mimeType,
    required this.isFavourite,
    required this.embeddings,
  });
}
