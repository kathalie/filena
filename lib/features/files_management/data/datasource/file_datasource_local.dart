import 'package:get_it/get_it.dart';

import '../../../../core/db/objectbox.dart';
import '../models/file_model.dart';
import 'dto/create_file_dto.dart';
import 'dto/file_dto.dart';
import 'file_datasource.dart';

class FileDatasourceLocal implements FileDataSource {
  final _fileBox = GetIt.I<ObjectBox>().store.box<File>();

  @override
  Future<int> createFile(CreateFileDto createFileDao) async {
    final fileModel = File.fromDao(createFileDao);

    _fileBox.put(fileModel);

    return fileModel.id;
  }

  @override
  Future<FileDto> getFile(int fileId) async {
    // return fileBox.get(fileId);
    // TODO implement getFile
    throw UnimplementedError();
  }

}
