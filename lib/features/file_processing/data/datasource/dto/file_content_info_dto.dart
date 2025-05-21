class FileContentInfoDto {
  final String summary;
  final List<String> keywords;

  FileContentInfoDto({
    required this.keywords,
    required this.summary,
  });
}

class FileContentInfoEntity {
  final String summary;
  final List<String> keywords;

  FileContentInfoEntity({
    required this.keywords,
    required this.summary,
  });

  // Convert from JSON to Dart object
  factory FileContentInfoEntity.fromJson(Map<String, dynamic> json) {
    return FileContentInfoEntity(
      summary: json['summary'] as String,
      keywords: json['keywords'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      'keywords': keywords,
    };
  }
}