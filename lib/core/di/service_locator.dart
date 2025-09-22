import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_client.dart';
import '../network/retrofit_client.dart';
import '../storage/shared_prefs_service.dart';
import '../storage/drift_database.dart';

class ConfigService {
  // Debug environment base URL (update with your actual debug URL)
  static const String _debugBaseUrl = 'https://msalesuat.tataskybroadband.com:8443';
  // Production environment base URL (update with your actual prod URL)
  static const String _prodBaseUrl = 'https://msales.tataskybroadband.com:';

  String get baseUrl {
    // Use debug URL in debug mode, prod URL in release mode
    if (kDebugMode) {
      return _debugBaseUrl;
    } else {
      return _prodBaseUrl;
    }
  }

  // You can add more config here, e.g., API keys, timeouts, etc.
  bool get isDebugMode => kDebugMode;
  String getFullEndpoint() {
    return baseUrl;
  }
}

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // SharedPrefsService wrapper
  getIt.registerLazySingleton<SharedPrefsService>(() => SharedPrefsService(getIt()));

  // Drift database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Dio client
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Retrofit client
  getIt.registerFactoryParam<RetrofitClient, String, void>((baseUrl, _) {
    final dio = getIt<DioClient>().dio;
    dio.options.baseUrl = baseUrl; // Set base URL dynamically here
    return RetrofitClient(dio);
  });
}