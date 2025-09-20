import 'dart:io';
import '../model/user.dart';

final class ClientService {
  static User? req;

  const ClientService._internal();

  /// give combine details and throw NativeException if failure
  static Future<User> getClient(String getUserNumber) async {
    if (req != null) return req!;
    try {
      final String deviceModel = "";
      final String version = Platform.version;
      final String checkVersion = true as String;
      final String client = Platform.operatingSystem;
      final String syncDate = "0";
      final String entityId = "1";
      final String versionCode = "552";
      final String userNumber = getUserNumber;
      final String syncCheck = true as String;
      final String apiType = "REST";
      return req = User(
          deviceModel: deviceModel,
          version: version,
          checkVersion: checkVersion,
          client: client,
          syncDate: syncDate,
          entityId: entityId,
          versionCode: versionCode,
          userNumber: userNumber,
          syncCheck: syncCheck,
          apiType:apiType
      );


    } catch (e) {
      throw Exception('Failed to get platform information: $e');
    }
  }
}
