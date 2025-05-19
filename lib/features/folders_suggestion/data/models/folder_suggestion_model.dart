import 'package:objectbox/objectbox.dart';

import '../../../files_management/data/models/file_model.dart';
import '../../../folders_management/data/models/folder_model.dart';

@Entity()
class FolderSuggestion {
  @Id()
  int id = 0;

  final String colorHex;

  final file = ToMany<File>();

  final folder = ToOne<Folder>();

  FolderSuggestion({
    required this.colorHex,
  });
}
