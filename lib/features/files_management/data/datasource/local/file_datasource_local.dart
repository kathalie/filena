import 'package:get_it/get_it.dart';

import '../../../../../core/db/objectbox.dart';
import '../../models/file_model.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../file_datasource.dart';

class FileDatasourceLocal implements FileDataSource {
  // final _store = GetIt.I<ObjectBox>().store;
  final _fileBox = GetIt.I<ObjectBox>().store.box<File>();

  @override
  Future<FileDto?> getFile(int id) async {
    final file = await _fileBox.getAsync(id);

    return file == null ? null : FileDto.fromModel(file);
  }

  @override
  Future<int> createFile(FileCreateDto createFileDao) async {
    final fileModel = File(
      name: createFileDao.name,
      hash: createFileDao.hash,
      mimeType: createFileDao.mimeType,
      isFavourite: false,
    );

    _fileBox.put(fileModel);

    return fileModel.id;
  }

  @override
  Future<void> deleteFile(int id) async {
    await _fileBox.removeAsync(id);
  }
}
