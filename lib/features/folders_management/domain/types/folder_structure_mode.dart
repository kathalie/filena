enum FolderStructureMode {
  classified('Classified'),
  unclassified('Unclassified'),
  suggestions('Suggestions');

  final String caption;

  const FolderStructureMode(this.caption);
}
