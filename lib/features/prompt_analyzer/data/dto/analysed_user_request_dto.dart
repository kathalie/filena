class AnalysedPromptDto {
  final String filesKeyword;
  final String suggestedFolder;
  final String explanation;

  AnalysedPromptDto({
    required this.filesKeyword,
    required this.suggestedFolder,
    required this.explanation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AnalysedPromptDto &&
              runtimeType == other.runtimeType &&
              suggestedFolder == other.suggestedFolder;

  @override
  int get hashCode => suggestedFolder.hashCode;
}
