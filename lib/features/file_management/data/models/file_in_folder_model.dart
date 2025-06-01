import 'package:objectbox/objectbox.dart';

import '../../../folder_management/data/models/folder_model.dart';
import 'file_model.dart';

@Entity()
class FileInFolder {
  @Id()
  int id = 0;

  final assignedFile = ToOne<File>();

  final assignedFolder = ToOne<Folder>();

  FileInFolder();
}
