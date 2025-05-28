import '../../common/helpers/fs_file_wrapper.dart';

abstract interface class SummaryClient {
  Future<String> generateSummary(FsFileWrapper fileWrapper);
}