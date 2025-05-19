import 'package:objectbox/objectbox.dart';

import '../../../folders_management/data/models/file_in_folder.dart';
import '../../../folders_suggestion/data/models/folder_suggestion_model.dart';
import '../datasource/dto/create_file_dto.dart';

// @Index() for searched columns
@Entity()
class File {
  @Id()
  int id = 0;

  final String name;

  @Unique()
  final String hash;

  final String mimeType;

  final int sizeInBytes;

  @Property(type: PropertyType.date)
  final DateTime timeCreated;

  @Property(type: PropertyType.date)
  final DateTime timeLastModified;

  @Backlink('file')
  final assignmentsToFolders = ToMany<FileInFolder>();

  @Backlink('file')
  final suggestedToAssignToFolders = ToMany<FolderSuggestion>();

  File(
    this.name,
    this.hash,
    this.mimeType,
    this.sizeInBytes,
    this.timeCreated,
    this.timeLastModified,
  );

  File.fromDao(CreateFileDto createFileDao)
      : name = createFileDao.name,
        hash = createFileDao.hash,
        mimeType = createFileDao.mimeType,
        sizeInBytes = createFileDao.sizeInBytes,
        timeCreated = createFileDao.timeCreated,
        timeLastModified = createFileDao.timeLastModified;
}
