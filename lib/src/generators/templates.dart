// ignore_for_file: constant_identifier_names

class Templates {
  // ================== FLAVOR ==================
  static const String flavorEnum = '''
enum Flavor {
  dev,
  qa,
  prod,
}
''';

  static const String flavorConfig = '''
import 'flavor.dart';

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;

  static late FlavorConfig instance;

  FlavorConfig({
    required this.flavor,
    required this.baseUrl,
  }) {
    instance = this;
  }

  bool get isDev => flavor == Flavor.dev;
  bool get isQa => flavor == Flavor.qa;
  bool get isProd => flavor == Flavor.prod;
}
''';

  // ================== MAIN FILES ==================
  static const String mainDev = '''
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/flavor/flavor.dart';
import 'app/flavor/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    baseUrl: "https://dev-api.com",
  );

  runApp(const App());
}
''';

  static const String mainQa = '''
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/flavor/flavor.dart';
import 'app/flavor/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.qa,
    baseUrl: "https://qa-api.com",
  );

  runApp(const App());
}
''';

  static const String mainProd = '''
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/flavor/flavor.dart';
import 'app/flavor/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.prod,
    baseUrl: "https://api.com",
  );

  runApp(const App());
}
''';

  // ================== APP ==================
  static const String app = '''
import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: Text('Flutter Architecture'),
        ),
      ),
    );
  }
}
''';

  static const String appRouter = '''
class AppRouter {
  static const String initial = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
}
''';

  static const String appTheme = '''
import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBg,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
    );
  }
}
''';

  static const String appColors = '''
import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF6200EE);
  static const Color primaryLight = Color(0xFF7C3AED);
  static const Color primaryDark = Color(0xFF5A189A);

  // Neutral
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkBg = Color(0xFF121212);

  // Gray
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray700 = Color(0xFF374151);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}
''';

  static const String appTextStyles = '''
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
}
''';

  // ================== CORE CONSTANTS ==================
  static const String apiConstants = '''
import '../../app/flavor/flavor_config.dart';

class ApiConstants {
  static String get baseUrl => FlavorConfig.instance.baseUrl;

  // Auth
  static const String loginEndpoint = '/api/v1/auth/login';
  static const String logoutEndpoint = '/api/v1/auth/logout';
  static const String registerEndpoint = '/api/v1/auth/register';

  // User
  static const String userProfileEndpoint = '/api/v1/user/profile';
  static const String updateProfileEndpoint = '/api/v1/user/profile/update';

  // Timeout durations
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
''';

  static const String appConstants = '''
class AppConstants {
  // App Info
  static const String appName = 'Flutter App';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int pageSize = 20;
  static const int initialPage = 1;

  // Cache
  static const int cacheExpiryDays = 7;
}
''';

  static const String storageKeys = '''
class StorageKeys {
  // Auth
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String user = 'user';

  // App Settings
  static const String appTheme = 'app_theme';
  static const String appLanguage = 'app_language';
  static const String onboardingCompleted = 'onboarding_completed';
}
''';

  // ================== CORE NETWORK ==================
  static const String dioClient = '''
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  late Dio _dio;

  DioClient._internal() {
    _initializeDio();
  }

  factory DioClient() {
    return _instance;
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    );
  }

  Dio get dio => _dio;
}
''';

  static const String apiService = '''
import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import 'dio_client.dart';

class ApiService {
  final Dio _dio = DioClient().dio;

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(
        '\${ApiConstants.baseUrl}\$endpoint',
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _dio.post(
        '\${ApiConstants.baseUrl}\$endpoint',
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await _dio.put(
        '\${ApiConstants.baseUrl}\$endpoint',
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String endpoint) async {
    try {
      await _dio.delete('\${ApiConstants.baseUrl}\$endpoint');
    } catch (e) {
      rethrow;
    }
  }
}
''';

  static const String requestInterceptor = '''
import 'package:dio/dio.dart';
import '../storage/app_secure_storage.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await AppSecureStorage().getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer \$token';
    }

    return handler.next(options);
  }
}
''';

  static const String responseInterceptor = '''
import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return handler.next(response);
  }
}
''';

  static const String errorInterceptor = '''
import 'package:dio/dio.dart';
import '../../core/exceptions/api_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    ApiException apiException;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        apiException = ApiException(
          message: 'Connection timeout',
          statusCode: err.response?.statusCode,
        );
        break;

      case DioExceptionType.badResponse:
        apiException = ApiException(
          message: err.response?.data['message'] ?? 'Server error',
          statusCode: err.response?.statusCode,
        );
        break;

      default:
        apiException = ApiException(
          message: err.message ?? 'Unknown error',
          statusCode: err.response?.statusCode,
        );
    }

    return handler.next(err);
  }
}
''';

  // ================== CORE SERVICES ==================
  static const String navigationService = '''
import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop({dynamic result}) {
    return navigatorKey.currentState!.pop(result);
  }
}
''';

  static const String storageService = '''
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    await Hive.initFlutter();
    _isInitialized = true;
  }

  Future<Box> openBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }

  Box getBox(String boxName) {
    if (!Hive.isBoxOpen(boxName)) {
      throw Exception("Box '\$boxName' is not opened. Call openBox first.");
    }
    return Hive.box(boxName);
  }

  Future<void> put(String boxName, String key, dynamic value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  T? get<T>(String boxName, String key) {
    final box = getBox(boxName);
    return box.get(key) as T?;
  }

  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  List<T> getAll<T>(String boxName) {
    final box = getBox(boxName);
    return box.values.cast<T>().toList();
  }

  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  Future<void> closeAll() async {
    await Hive.close();
  }
}
''';

  static const String appSecureStorage = '''
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = "auth_token";

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> writeString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readString(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> writeMap(String key, Map<String, dynamic> value) async {
    await _storage.write(key: key, value: jsonEncode(value));
  }

  Future<Map<String, dynamic>?> readMap(String key) async {
    final value = await _storage.read(key: key);
    return value != null ? jsonDecode(value) : null;
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
''';

  // ================== CORE UTILS ==================
  static const String validators = '''
class Validators {
  static String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$',
    );

    if (!emailRegex.hasMatch(value!)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Password is required';
    }

    if (value!.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Phone is required';
    }

    final phoneRegex = RegExp(r'^[+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}\$');

    if (!phoneRegex.hasMatch(value!)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Username is required';
    }

    if (value!.length < 3) {
      return 'Username must be at least 3 characters';
    }

    return null;
  }
}
''';

  static const String extensions = '''
import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1100;
  bool get isDesktop => screenWidth >= 1100;
}

extension StringExtension on String {
  String get capitalize => '\${this[0].toUpperCase()}\${substring(1)}';

  bool get isValidEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$',
    );
    return emailRegex.hasMatch(this);
  }
}

extension ListExtension<T> on List<T> {
  List<T> get unique {
    final seen = <T>{};
    return where((element) => seen.add(element)).toList();
  }
}
''';

  static const String helpers = '''
class Helpers {
  static Map<String, dynamic> parseQueryString(String query) {
    final params = <String, dynamic>{};
    final pairs = query.split('&');

    for (final pair in pairs) {
      final idx = pair.indexOf('=');
      if (idx > 0) {
        final key = Uri.decodeComponent(pair.substring(0, idx));
        final value = Uri.decodeComponent(pair.substring(idx + 1));
        params[key] = value;
      }
    }

    return params;
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
''';

  // ================== CORE EXCEPTIONS ==================
  static const String apiException = '''
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  @override
  String toString() => message;
}

class ParseException implements Exception {
  final String message;

  ParseException({required this.message});

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});

  @override
  String toString() => message;
}
''';

  // ================== CORE WIDGETS ==================
  static const String appButton = '''
import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double height;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          disabledBackgroundColor: AppColors.gray300,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
''';

  static const String appTextfield = '''
import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final int maxLines;
  final int minLines;

  const AppTextField({
    Key? key,
    required this.label,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.maxLines = 1,
    this.minLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          maxLines: obscureText ? 1 : maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onSuffixIconPressed,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
''';

  static const String loadingWidget = '''
import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;

  const LoadingWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.primary),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!),
          ],
        ],
      ),
    );
  }
}
''';

  static const String errorWidget = '''
import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';

class ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorWidget({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: AppColors.error, size: 48),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
''';

  // ================== CORE API MODELS ==================
  static const String apiResponse = '''
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return ApiResponse(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: fromJsonT != null && json["data"] != null
          ? fromJsonT(json["data"])
          : null,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T)? toJsonT) {
    return {
      "success": success,
      "message": message,
      "data": data != null && toJsonT != null ? toJsonT(data) : null,
    };
  }
}
''';

  // ================== INJECTION ==================
  static const String dependencyInjection = '''
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../core/network/dio_client.dart';
import '../core/network/api_service.dart';
import '../core/services/storage_service.dart';
import '../core/storage/app_secure_storage.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Network
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<ApiService>(ApiService());

  // Storage
  getIt.registerSingleton<HiveService>(HiveService());
  await getIt<HiveService>().init();

  getIt.registerSingleton<AppSecureStorage>(AppSecureStorage());

  // TODO: Add more dependencies here
  // Repositories
  // Use Cases
  // BLoCs
}
''';

  // ================== FEATURE TEMPLATES ==================
  static String featureEntity(String featureName) {
    final className = _capitalize(featureName);
    return '''
class ${className}Entity {
  final String id;
  final String name;

  const ${className}Entity({
    required this.id,
    required this.name,
  });
}
''';
  }

  static String featureModel(String featureName) {
    final className = _capitalize(featureName);
    return '''
import '../../../domain/entities/${featureName}_entity.dart';

class ${className}Model extends ${className}Entity {
  const ${className}Model({
    required super.id,
    required super.name,
  });

  factory ${className}Model.fromJson(Map<String, dynamic> json) {
    return ${className}Model(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
''';
  }

  static String featureRemoteDatasource(String featureName) {
    final className = _capitalize(featureName);
    return '''
import '../models/${featureName}_model.dart';

abstract class ${className}RemoteDatasource {
  Future<${className}Model> get${className}();
}

class ${className}RemoteDatasourceImpl implements ${className}RemoteDatasource {
  @override
  Future<${className}Model> get${className}() async {
    // TODO: Implement remote API call
    throw UnimplementedError();
  }
}
''';
  }

  static String featureRepository(String featureName) {
    final className = _capitalize(featureName);
    return '''
import '../../domain/entities/${featureName}_entity.dart';
import '../../domain/repositories/${featureName}_repository.dart';
import '../datasource/${featureName}_remote_datasource.dart';

class ${className}RepositoryImpl implements ${className}Repository {
  final ${className}RemoteDatasource remoteDatasource;

  ${className}RepositoryImpl({required this.remoteDatasource});

  @override
  Future<${className}Entity> get${className}() async {
    try {
      final model = await remoteDatasource.get${className}();
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
''';
  }

  static String featureRepositoryAbstract(String featureName) {
    final className = _capitalize(featureName);
    return '''
import '../entities/${featureName}_entity.dart';

abstract class ${className}Repository {
  Future<${className}Entity> get${className}();
}
''';
  }

  static String featureUsecase(String featureName) {
    final className = _capitalize(featureName);
    return '''
import '../../domain/entities/${featureName}_entity.dart';
import '../../domain/repositories/${featureName}_repository.dart';

class Get${className}Usecase {
  final ${className}Repository repository;

  Get${className}Usecase({required this.repository});

  Future<${className}Entity> call() async {
    return await repository.get${className}();
  }
}
''';
  }

  static String featureBloc(String featureName) {
    final className = _capitalize(featureName);
    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_${featureName}_usecase.dart';
import '${featureName}_event.dart';
import '${featureName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  final Get${className}Usecase get${className}Usecase;

  ${className}Bloc({required this.get${className}Usecase})
      : super(${className}InitialState()) {
    on<Get${className}Event>((event, emit) async {
      emit(${className}LoadingState());
      try {
        final result = await get${className}Usecase();
        emit(${className}LoadedState(result));
      } catch (e) {
        emit(${className}ErrorState(e.toString()));
      }
    });
  }
}
''';
  }

  static String featureEvent(String featureName) {
    final className = _capitalize(featureName);
    return '''
abstract class ${className}Event {
  const ${className}Event();
}

class Get${className}Event extends ${className}Event {
  const Get${className}Event();
}
''';
  }

  static String featureState(String featureName) {
    final className = _capitalize(featureName);
    return '''
import '../../domain/entities/${featureName}_entity.dart';

abstract class ${className}State {
  const ${className}State();
}

class ${className}InitialState extends ${className}State {
  const ${className}InitialState();
}

class ${className}LoadingState extends ${className}State {
  const ${className}LoadingState();
}

class ${className}LoadedState extends ${className}State {
  final ${className}Entity data;

  const ${className}LoadedState(this.data);
}

class ${className}ErrorState extends ${className}State {
  final String message;

  const ${className}ErrorState(this.message);
}
''';
  }

  static String featureScreen(String featureName) {
    final className = _capitalize(featureName);
    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/${featureName}_bloc.dart';
import '../../presentation/bloc/${featureName}_event.dart';
import '../../presentation/bloc/${featureName}_state.dart';

class ${className}Screen extends StatefulWidget {
  const ${className}Screen({super.key});

  @override
  State<${className}Screen> createState() => _${className}ScreenState();
}

class _${className}ScreenState extends State<${className}Screen> {
  @override
  void initState() {
    super.initState();
    context.read<${className}Bloc>().add(const Get${className}Event());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${className}')),
      body: BlocBuilder<${className}Bloc, ${className}State>(
        builder: (context, state) {
          if (state is ${className}LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ${className}LoadedState) {
            return Center(child: Text(state.data.name));
          } else if (state is ${className}ErrorState) {
            return Center(child: Text('Error: \${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
''';
  }

  // Helper method to capitalize string
  static String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
