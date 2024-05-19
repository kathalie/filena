import 'package:isar/isar.dart';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import '../../../library_management/data/models/file_model.dart';
import '../../../library_management/data/models/tag_model.dart';
import '../../../synchronization/data/models/device_model.dart';
import '../../business/entities/file_version_entity.dart';

part 'file_version_model.g.dart';

@collection
class FileVersion {
  Id id = Isar.autoIncrement;

  late DateTime dateEdited;

  late String fileLocation;

  late String fileName;

  String? description;

  bool isFavourite = false;

  final file = IsarLink<File>();

  final tags = IsarLinks<Tag>();

  @Backlink(to: 'fileVersionsToSync')
  final devicesToSyncWith = IsarLinks<Device>();
}
