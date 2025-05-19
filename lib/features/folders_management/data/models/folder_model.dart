import 'package:objectbox/objectbox.dart';

import 'file_in_folder.dart';


@Entity()
class Folder {
  @Id()
  int id = 0;

  final String name;

  final bool needsConfirmation;

  ToOne<Folder> parent = ToOne<Folder>();

  @Backlink('parent')
  final children = ToMany<Folder>();

  @Backlink('folder')
  final assignmentsToFiles = ToMany<FileInFolder>();

  // @Backlink('folder')
  // final suggestedToAssignToFile

  Folder({
    required this.name,
    required this.needsConfirmation,

});
}
