import 'package:objectbox/objectbox.dart';

import 'file_model.dart';

@Entity()
class Folder {
  @Id()
  int id = 0;

  String name;

  @HnswIndex(dimensions: 10, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.floatVector)
  List<double> embeddings;

  ToOne<Folder> parent = ToOne<Folder>();

  @Backlink('parent')
  final children = ToMany<Folder>();

  final assignedFiles = ToMany<File>();

  Folder({
    required this.name,
    required this.embeddings,
  });
}
