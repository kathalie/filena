import '../../../file_content_processing/domain/repository_interfaces/repository.dart';
import '../../common/helpers/file_category.dart';
import '../../common/helpers/fs_file_wrapper.dart';
import '../datasource_interfaces/summary_client.dart';

class SummaryClientImpl implements SummaryClient {
  final FileContentProcessingRepository _fileContentProcessingRepository;

  SummaryClientImpl(this._fileContentProcessingRepository);

  @override
  Future<String> generateSummary(FsFileWrapper fileWrapper) async {
    final fileCategory = FileCategory.fromMimeType(await fileWrapper.mimeType);

    switch (fileCategory) {
      case FileCategory.document:
        {
          final stringContent = await fileWrapper.contentAsString;
          final result = await _fileContentProcessingRepository
              .processTextFileContent(stringContent);

          return result.summary;
        }

      case FileCategory.image:
        final base64 = await fileWrapper.contentAsBase64;
        final result = await _fileContentProcessingRepository
            .processImageFileContent(base64);

        return result.summary;
      case FileCategory.video:
        // TODO: Handle video case.
        return '';
      case FileCategory.audio:
        // TODO: Handle audio case.
        return '';
      case FileCategory.other:
        // TODO: Handle other case.
        return '';
    }
  }
}
