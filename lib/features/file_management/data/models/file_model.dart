import 'package:objectbox/objectbox.dart';

import '../datasource/dao/create_file_dao.dart';

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

  // int get dbTimeCreated => timeCreated.millisecondsSinceEpoch;
  //
  // set dbTimeCreated(int value) {
  //   timeCreated = DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);
  // }

  @Property(type: PropertyType.date)
  final DateTime timeLastModified;

  // int get dbTimeLastModified => timeLastModified.millisecondsSinceEpoch;
  //
  // set dbTimeLastModified(int value) {
  //   timeLastModified = DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);
  // }

  File(CreateFileDao createFileDao)
      : name = createFileDao.name,
        hash = createFileDao.hash,
        mimeType = createFileDao.mimeType,
        sizeInBytes = createFileDao.sizeInBytes,
        timeCreated = createFileDao.timeCreated,
        timeLastModified = createFileDao.timeLastModified;
}
