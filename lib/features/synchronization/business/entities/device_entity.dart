class DeviceEntity {
  final String id;
  final String name;
  final String ipAddress;
  final int port;
  final List<String> fileVersionIdsToSync;

  const DeviceEntity({
    required this.id,
    required this.name,
    required this.port,
    required this.ipAddress,
    this.fileVersionIdsToSync = const [],
  });
}
