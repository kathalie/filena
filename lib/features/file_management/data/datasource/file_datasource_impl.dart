import 'package:get_it/get_it.dart';

import '../../../../core/db/objectbox.dart';
import '../models/file_model.dart';
import 'dao/create_file_dao.dart';
import 'dao/file_dao.dart';
import 'file_datasource.dart';

class FileDatasourceImpl implements FileDataSource {
  final fileBox = GetIt.I<ObjectBox>().store.box<File>();

  @override
  Future<int> createFile(CreateFileDao createFileDao) async {
    final fileModel = File(createFileDao);

    fileBox.put(fileModel);

    return fileModel.id;
  }

  @override
  Future<FileDao> getFile(int fileId) async {
    // return fileBox.get(fileId);
    // TODO implement getFile
    throw UnimplementedError();
  }

}
