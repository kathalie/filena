import 'package:objectbox/objectbox.dart';

import '../../../files_management/data/models/file_model.dart';
import '../../../folders_management/data/models/folder_model.dart';

@Entity()
class FolderSuggestion {
  @Id()
  int id = 0;

  final int colorHex;

  final String explanation;

  final files = ToMany<File>();

  final folder = ToOne<Folder>();

  FolderSuggestion({
    required this.colorHex,
    required this.explanation,
  });
}
