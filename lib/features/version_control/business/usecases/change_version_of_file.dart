import '../../../library_management/business/repository_interfaces/file_repository.dart';

class ChangeVersionOfFileUseCase {
  final FileRepository fileRepository;

  const ChangeVersionOfFileUseCase({
    required this.fileRepository,
  });

  Future<void> call({
    required String fileId,
    required String newCurrentVersionId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
