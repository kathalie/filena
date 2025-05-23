import 'package:get_it/get_it.dart';
import 'package:proper_filesize/proper_filesize.dart';
import 'package:intl/intl.dart';

import '../../../../../business/repository_interfaces/file_repository.dart';
import '../../../../../domain/entities/file_details_entity.dart';
import '../../../../../domain/entities/file_entity.dart';
import '../../../../../domain/enums/file_category.dart';

class FileRowPresenter {
  final _fileRepository = GetIt.I.get<FileRepository>();
  final FileEntity _fileEntity;

  FileRowPresenter(FileEntity fileEntity) : _fileEntity = fileEntity;

  FileCategory get fileCategory => _fileEntity.fileDetails.fileCategory;

  String get name => _fileEntity.fileDetails.name;

  bool get isFavourite => _fileEntity.isFavourite;

  String get size => toMetricFileSize(_fileEntity.fileDetails.sizeInBytes);

  String get lastModified =>
      formatDateTime(_fileEntity.fileDetails.timeLastModified);

  String get dateCreated =>
      formatDateTime(_fileEntity.fileDetails.timeLastModified);

  Future<void> toggleFavourite() async {
    //_fileRepository
    //TODO toggle favourite
  }

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
