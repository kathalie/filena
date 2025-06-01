import 'package:objectbox/objectbox.dart';

import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../../../folder_management/data/models/folder_model.dart';
import '../../common/helpers/file_category.dart';
import 'file_in_folder_model.dart';

@Entity()
class File {
  @Id()
  int id = 0;

  @Unique()
  String storageKey;

  String name;

  bool isPrioritized;

  int currentVersion;

  String mimeType;

  int categoryId;

  FileCategory get category => FileCategory.values[categoryId];
  set category(FileCategory cat) => categoryId = cat.index;

  @HnswIndex(dimensions: 10, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.floatVector)
  List<double> embeddings;

  @Backlink('assignedFile')
  final folderAssignments = ToMany<FileInFolder>();

  @Backlink('files')
  final folderSuggestions = ToMany<FolderSuggestion>();

  File({
    required this.storageKey,
    required this.currentVersion,
    required this.name,
    required this.mimeType,
    required this.isPrioritized,
    required this.embeddings,
  }): categoryId = FileCategory.fromMimeType(mimeType).index;
}
