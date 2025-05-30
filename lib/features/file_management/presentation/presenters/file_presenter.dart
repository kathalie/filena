import 'package:proper_filesize/proper_filesize.dart';
import 'package:intl/intl.dart';

import '../../common/helpers/file_category.dart';
import '../../domain/entities/file_metadata_entity.dart';
import '../../domain/entities/file_entity.dart';

class FilePresenter {
  final FileEntity fileEntity;

  FilePresenter(this.fileEntity);

  FileCategory get fileCategory => fileEntity.fileCategory;

  int get id => fileEntity.id;

  String get name => fileEntity.name;

  bool get isPrioritized => fileEntity.isPrioritized;

  String get size => toMetricFileSize(fileEntity.fileMetadata.sizeInBytes);

  String get lastModified =>
      formatDateTime(fileEntity.fileMetadata.timeLastModified);

  String get dateCreated =>
      formatDateTime(fileEntity.fileMetadata.timeLastModified);

  String toMetricFileSize(int bytes) {
    return FileSize.fromBytes(bytes).toString(
      unit: Unit.auto(size: bytes, baseType: BaseType.metric),
    );
  }

  String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';

    final DateFormat formatter = DateFormat('MMM dd, yyyy');

    return formatter.format(dateTime);
  }
}
