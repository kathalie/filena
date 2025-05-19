import 'package:objectbox/objectbox.dart';

import '../../../files_management/data/models/file_model.dart';
import 'folder_model.dart';

@Entity()
class FileInFolder {
  @Id()
  int id = 0;

  final file = ToOne<File>();

  final folder = ToOne<Folder>();
}