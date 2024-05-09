class AddToSyncListParams {
  final List<String> fileVersionIds;
  final String destinationDeviceId;

  const AddToSyncListParams({
    required this.fileVersionIds,
    required this.destinationDeviceId,
  });
}
