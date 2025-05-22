import 'package:objectbox/objectbox.dart';

import 'folder_model.dart';

// @Index() for searched columns
@Entity()
class File {
  @Id()
  int id = 0;

  final String name;

  @Unique()
  final String hash;

  final String mimeType;

  final bool isFavourite;

  @HnswIndex(dimensions: 10, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.floatVector)
  List<double>? embeddings;

  @Backlink('assignedFiles')
  final parentFolders = ToMany<Folder>();

  File({
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.isFavourite,
  });
}
