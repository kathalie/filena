class UpdateDeviceParams {
  final String deviceId;
  final String? ipAddress;
  final String? port;

  const UpdateDeviceParams({
    required this.deviceId,
    this.ipAddress,
    this.port,
  });
}
