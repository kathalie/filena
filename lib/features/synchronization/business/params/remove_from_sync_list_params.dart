class RemoveFromSyncListParams {
  final List<String> fileVersionIds;
  final String destinationDeviceId;

  const RemoveFromSyncListParams({
    required this.fileVersionIds,
    required this.destinationDeviceId,
  });
}
