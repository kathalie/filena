import 'dart:math';

import 'package:filena/features/files_management/domain/entities/file_details_entity.dart';
import 'package:filena/features/files_management/domain/entities/file_entity.dart';

class MockFileRepository {
  final _random = Random();

  int _randomFileSize(int minKB, int maxKB) {
    return (_random.nextInt(maxKB - minKB) + minKB) * 1024;
  }

  DateTime _randomDate() {
    final now = DateTime.now();
    final daysAgo = _random.nextInt(90);
    return now.subtract(
      Duration(
        days: daysAgo,
        hours: _random.nextInt(24),
        minutes: _random.nextInt(60),
      ),
    );
  }

  final List<Map<String, String>> _fileTypes = [
    {'ext': 'pdf', 'mime': 'application/pdf'},
    {
      'ext': 'docx',
      'mime':
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    },
    {
      'ext': 'xlsx',
      'mime':
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    },
    {
      'ext': 'pptx',
      'mime':
          'application/vnd.openxmlformats-officedocument.presentationml.presentation'
    },
    {'ext': 'jpg', 'mime': 'image/jpeg'},
    {'ext': 'png', 'mime': 'image/png'},
    {'ext': 'mp4', 'mime': 'video/mp4'},
    {'ext': 'txt', 'mime': 'text/plain'},
    {'ext': 'csv', 'mime': 'text/csv'},
    {'ext': 'zip', 'mime': 'application/zip'},
  ];

  final List<String> _fileNamePrefixes = [
    'Project',
    'Report',
    'Presentation',
    'Document',
    'Meeting',
    'Plan',
    'Analysis',
    'Notes',
    'Research',
    'Data',
    'Budget',
    'Proposal',
    'Invoice',
    'Contract',
    'Screenshot',
  ];

  FileEntity _generateRandomFileEntity(int id) {
    final fileType = _fileTypes[_random.nextInt(_fileTypes.length)];
    final extension = fileType['ext']!;
    final mimeType = fileType['mime']!;

    final created = _randomDate();
    final daysAfterCreation = _random.nextInt(10);
    final modified = created.add(Duration(days: daysAfterCreation));

    final namePrefix =
        _fileNamePrefixes[_random.nextInt(_fileNamePrefixes.length)];
    final fileNumber = _random.nextInt(100);
    final name = '$namePrefix $fileNumber.$extension';

    int sizeInBytes;
    switch (extension) {
      case 'pdf':
      case 'docx':
      case 'xlsx':
        sizeInBytes = _randomFileSize(100, 5000);
        break;
      case 'pptx':
        sizeInBytes = _randomFileSize(1000, 10000);
        break;
      case 'jpg':
      case 'png':
        sizeInBytes = _randomFileSize(50, 3000);
        break;
      case 'mp4':
        sizeInBytes = _randomFileSize(5000, 50000);
        break;
      default:
        sizeInBytes = _randomFileSize(10, 500);
    }

    final isFavourite = _random.nextDouble() < 0.3;

    return FileEntity(
      id: id,
      isFavourite: isFavourite,
      fileDetails: FileDetailsEntity(
        name: name,
        sizeInBytes: sizeInBytes,
        timeCreated: created,
        timeLastModified: modified,
        mimeType: mimeType,
      ),
    );
  }

  Stream<List<FileEntity>> getMockedFilesStream() {
    final List<FileEntity> fileEntities = List.generate(
      10,
      (index) => _generateRandomFileEntity(index + 1),
    );

    return Stream.value(fileEntities);
  }

  Stream<List<FileEntity>> getMockedFilesStreamWithUpdates() {
    return Stream.periodic(const Duration(seconds: 10), (count) {
      return List.generate(
        10,
        (index) => _generateRandomFileEntity(index + 1),
      );
    });
  }
}
