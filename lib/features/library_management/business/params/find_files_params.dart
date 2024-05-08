enum SortOrder {
  asc,
  desc,
}

enum SortField {
  date,
}

class FindFilesParams {
  final String collectionId;
  final SortField sortField;
  final SortOrder sortOrder;
  final String? descriptionPart;
  final List<String>? tagIds;
  final bool? isChosen;
  final (DateTime dateCreatedFrom, DateTime dateCreatedTo)? dateCreatedRange;

  const FindFilesParams({
    required this.collectionId,
    this.sortField = SortField.date,
    this.sortOrder = SortOrder.asc,
    this.descriptionPart,
    this.tagIds,
    this.isChosen,
    this.dateCreatedRange,
  });
}
