sealed class FileLocation {}

class FilePath implements FileLocation {
  final String link;
  final String fileName;

  const FilePath({
    required this.link,
    required this.fileName,
  });
}

class ObjectLocation implements FileLocation {
  final String bucket;
  final String objectName;

  const ObjectLocation({
    required this.bucket,
    required this.objectName,
  });
}
