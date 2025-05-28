import 'dart:convert';

class ProcessedFileContentDto {
  final String summary;
  // final List<String> keywords;

  ProcessedFileContentDto({
    // required this.keywords,
    required this.summary,
  });

  factory ProcessedFileContentDto.fromJson(Map<String, dynamic> json) {
    final responseMap = jsonDecode(json['response'] as String);

    return ProcessedFileContentDto(
      summary: responseMap['summary'] as String,
      // keywords: responseMap['keywords'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
      // 'keywords': keywords,
    };
  }
}
