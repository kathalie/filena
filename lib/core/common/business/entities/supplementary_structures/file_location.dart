sealed class FileLocation {}

class FilePath implements FileLocation {
  final String link;

  const FilePath({
    required this.link,
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
