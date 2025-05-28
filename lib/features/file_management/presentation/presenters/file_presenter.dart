import 'package:proper_filesize/proper_filesize.dart';
import 'package:intl/intl.dart';

import '../../common/helpers/file_category.dart';
import '../../domain/entities/file_metadata_entity.dart';
import '../../domain/entities/file_entity.dart';

class FilePresenter {
  final FileEntity _fileEntity;

  FilePresenter(FileEntity fileEntity) : _fileEntity = fileEntity;

  FileCategory get fileCategory => _fileEntity.fileMetadata.fileCategory;

  String get id => _fileEntity.id;

  String get name => _fileEntity.fileMetadata.name;

  bool get isPrioritized => _fileEntity.isPrioritized;

  String get size => toMetricFileSize(_fileEntity.fileMetadata.sizeInBytes);

  String get lastModified =>
      formatDateTime(_fileEntity.fileMetadata.timeLastModified);

  String get dateCreated =>
      formatDateTime(_fileEntity.fileMetadata.timeLastModified);

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

  void togglePrioritized() {
    //TODO toggle favourite
  }
}
