import 'dart:io';

import '../utils/file_writer.dart';
import 'templates.dart';

class StructureGenerator {
  static Future<void> generate() async {
    print('🚀 Creating Flutter Architecture Structure...\n');

    // Create all required folders
    final folders = [
      'lib/app/router',
      'lib/app/theme',
      'lib/app/flavor',
      'lib/core/constants',
      'lib/core/network',
      'lib/core/services',
      'lib/core/storage',
      'lib/core/utils',
      'lib/core/extensions',
      'lib/core/widgets',
      'lib/core/exceptions',
      'lib/features',
      'lib/injection',
      'lib/generated',
    ];

    print('📁 Creating directories...');
    for (final folder in folders) {
      await Directory(folder).create(recursive: true);
    }
    print('✅ Directories created\n');

    // App Files
    print('📝 Creating app files...');
    await FileWriter.create('lib/app/flavor/flavor.dart', Templates.flavorEnum);
    await FileWriter.create(
      'lib/app/flavor/flavor_config.dart',
      Templates.flavorConfig,
    );
    await FileWriter.create('lib/app/app.dart', Templates.app);
    await FileWriter.create(
      'lib/app/router/app_router.dart',
      Templates.appRouter,
    );
    await FileWriter.create('lib/app/theme/app_theme.dart', Templates.appTheme);
    await FileWriter.create('lib/app/theme/colors.dart', Templates.appColors);
    await FileWriter.create(
      'lib/app/theme/text_styles.dart',
      Templates.appTextStyles,
    );
    print('✅ App files created\n');

    // Main Files
    print('📝 Creating main entry files...');
    await FileWriter.create('lib/main_dev.dart', Templates.mainDev);
    await FileWriter.create('lib/main_qa.dart', Templates.mainQa);
    await FileWriter.create('lib/main_prod.dart', Templates.mainProd);
    print('✅ Main files created\n');

    // Core Constants
    print('📝 Creating core constants...');
    await FileWriter.create(
      'lib/core/constants/api_constants.dart',
      Templates.apiConstants,
    );
    await FileWriter.create(
      'lib/core/constants/app_constants.dart',
      Templates.appConstants,
    );
    await FileWriter.create(
      'lib/core/constants/storage_keys.dart',
      Templates.storageKeys,
    );
    print('✅ Constants created\n');

    // Core Network
    print('📝 Creating network layer...');
    await FileWriter.create(
      'lib/core/network/dio_client.dart',
      Templates.dioClient,
    );
    await FileWriter.create(
      'lib/core/network/api_service.dart',
      Templates.apiService,
    );
    await FileWriter.create(
      'lib/core/network/interceptors/request_interceptor.dart',
      Templates.requestInterceptor,
    );
    await FileWriter.create(
      'lib/core/network/interceptors/response_interceptor.dart',
      Templates.responseInterceptor,
    );
    await FileWriter.create(
      'lib/core/network/interceptors/error_interceptor.dart',
      Templates.errorInterceptor,
    );
    print('✅ Network layer created\n');

    // Core Services
    print('📝 Creating services...');
    await FileWriter.create(
      'lib/core/services/navigation_service.dart',
      Templates.navigationService,
    );
    await FileWriter.create(
      'lib/core/services/storage_service.dart',
      Templates.storageService,
    );
    await FileWriter.create(
      'lib/core/storage/app_secure_storage.dart',
      Templates.appSecureStorage,
    );
    print('✅ Services created\n');

    // Core Utils
    print('📝 Creating utilities...');
    await FileWriter.create(
      'lib/core/utils/validators.dart',
      Templates.validators,
    );
    await FileWriter.create(
      'lib/core/utils/extensions.dart',
      Templates.extensions,
    );
    await FileWriter.create('lib/core/utils/helpers.dart', Templates.helpers);
    print('✅ Utilities created\n');

    // Core Exceptions
    print('📝 Creating exceptions...');
    await FileWriter.create(
      'lib/core/exceptions/api_exception.dart',
      Templates.apiException,
    );
    print('✅ Exceptions created\n');

    // Core Widgets
    print('📝 Creating widgets...');
    await FileWriter.create(
      'lib/core/widgets/app_button.dart',
      Templates.appButton,
    );
    await FileWriter.create(
      'lib/core/widgets/app_textfield.dart',
      Templates.appTextfield,
    );
    await FileWriter.create(
      'lib/core/widgets/loading_widget.dart',
      Templates.loadingWidget,
    );
    await FileWriter.create(
      'lib/core/widgets/error_widget.dart',
      Templates.errorWidget,
    );
    print('✅ Widgets created\n');

    // API Models
    print('📝 Creating API models...');
    await FileWriter.create(
      'lib/core/models/api_response.dart',
      Templates.apiResponse,
    );
    print('✅ API models created\n');

    // Dependency Injection
    print('📝 Creating dependency injection setup...');
    await FileWriter.create(
      'lib/injection/dependency_injection.dart',
      Templates.dependencyInjection,
    );
    print('✅ Dependency injection created\n');

    print('✨ Flutter Architecture created successfully!');
    print('📚 Next steps:');
    print('  1. Update pubspec.yaml with dependencies');
    print('  2. Run: flutter pub get');
    print(
      '  3. Create features using: flutter_arch create-feature <feature-name>',
    );
  }
}
