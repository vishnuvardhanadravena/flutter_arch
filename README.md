# Flutter Architecture CLI
# Flutter Arch

Generate Flutter Clean Architecture project structure.

## Install

dart pub global activate flutter_arch

## Usage

flutter_arch init

flutter_arch create-feature auth
A comprehensive command-line tool for generating Flutter projects with clean architecture, best practices, and all necessary boilerplate code.

## Features

✨ **Complete Project Structure**
- Multi-flavor support (dev, qa, prod)
- Clean architecture layers (presentation, domain, data)
- Pre-configured directory structure

🎨 **App Design System**
- Centralized theme management
- Color palette
- Text styles
- Responsive design utilities

🔧 **Core Services**
- HTTP Client (Dio) with interceptors
- Secure storage management
- Navigation service
- Local storage (Hive)
- Dependency injection (GetIt)

📦 **Reusable Components**
- Pre-built widgets (buttons, text fields, loaders, error displays)
- Input validators
- Exception handling
- API response models
- Extension functions

🏗️ **Feature Scaffolding**
- BLoC pattern implementation
- Data, Domain, and Presentation layers
- Repository pattern
- Use case pattern
- Models and entities

## Installation

### Option 1: From pub.dev
```bash
dart pub global activate flutter_arch
```

### Option 2: From source
```bash
git clone https://github.com/your_org/flutter_arch.git
cd flutter_arch
dart pub global activate --source path .
```

## Usage

### 1. Create a New Flutter Project
```bash
flutter create my_app
cd my_app
```

### 2. Initialize the Architecture
```bash
flutter_arch init
# or
flutter_arch create-structure
```

This command creates:
- `lib/app/` - Application configuration, theme, routing, and flavors
- `lib/core/` - Reusable core utilities, services, widgets, and network
- `lib/features/` - Feature modules directory
- `lib/injection/` - Dependency injection setup
- `lib/main_dev.dart`, `lib/main_qa.dart`, `lib/main_prod.dart` - Entry points for each flavor

### 3. Create Features
```bash
flutter_arch create-feature auth
```

This creates a complete feature structure:
```
lib/features/auth/
├── data/
│   ├── datasource/
│   │   └── auth_remote_datasource.dart
│   ├── models/
│   │   └── auth_model.dart
│   └── repositories/
│       └── auth_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── auth_entity.dart
│   ├── repositories/
│   │   └── auth_repository.dart
│   └── usecases/
│       └── get_auth_usecase.dart
└── presentation/
    ├── bloc/
    │   ├── auth_bloc.dart
    │   ├── auth_event.dart
    │   └── auth_state.dart
    ├── screens/
    │   └── auth_screen.dart
    └── widgets/
```

## Project Structure

```
lib/
├── main_dev.dart          # Dev flavor entry point
├── main_qa.dart           # QA flavor entry point
├── main_prod.dart         # Production flavor entry point
│
├── app/
│   ├── app.dart           # Main app widget
│   ├── router/
│   │   └── app_router.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── colors.dart
│   │   └── text_styles.dart
│   └── flavor/
│       ├── flavor.dart
│       └── flavor_config.dart
│
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   ├── app_constants.dart
│   │   └── storage_keys.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   ├── api_service.dart
│   │   └── interceptors/
│   │       ├── request_interceptor.dart
│   │       ├── response_interceptor.dart
│   │       └── error_interceptor.dart
│   ├── services/
│   │   ├── navigation_service.dart
│   │   └── storage_service.dart
│   ├── storage/
│   │   └── app_secure_storage.dart
│   ├── utils/
│   │   ├── validators.dart
│   │   ├── extensions.dart
│   │   └── helpers.dart
│   ├── widgets/
│   │   ├── app_button.dart
│   │   ├── app_textfield.dart
│   │   ├── loading_widget.dart
│   │   └── error_widget.dart
│   ├── exceptions/
│   │   └── api_exception.dart
│   └── models/
│       └── api_response.dart
│
├── features/
│   └── [feature_name]/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── injection/
    └── dependency_injection.dart
```

## Build Flavors

Run your app with different flavors:

```bash
# Development
flutter run -t lib/main_dev.dart --flavor dev

# QA
flutter run -t lib/main_qa.dart --flavor qa

# Production
flutter run -t lib/main_prod.dart --flavor prod
```

## Adding Dependencies

After running `flutter_arch init`, add the required dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.0
  bloc: ^8.1.0
  
  # HTTP & Networking
  dio: ^5.3.0
  
  # Local Storage
  hive: ^2.2.0
  hive_flutter: ^1.1.0
  
  # Secure Storage
  flutter_secure_storage: ^9.0.0
  
  # Dependency Injection
  get_it: ^7.5.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code Generation
  build_runner: ^2.4.0
  hive_generator: ^2.0.0
```

Then run:
```bash
flutter pub get
flutter pub run build_runner build
```

## Quick Start Example

1. Create a new Flutter project:
```bash
flutter create my_app
cd my_app
```

2. Initialize architecture:
```bash
flutter_arch init
```

3. Create auth feature:
```bash
flutter_arch create-feature auth
```

4. Add dependencies to `pubspec.yaml` (see "Adding Dependencies" section)

5. Implement your auth feature:
   - Update `auth_remote_datasource.dart` with API calls
   - Implement methods in `auth_repository_impl.dart`
   - Update UI in `auth_screen.dart`
   - Register dependencies in `dependency_injection.dart`

## Commands Reference

```bash
# Initialize project structure
flutter_arch init
flutter_arch create-structure

# Create a new feature
flutter_arch create-feature <feature-name>
flutter_arch feature <feature-name>

# Help and version
flutter_arch --help    # or -h
flutter_arch --version # or -v
```

## Best Practices

1. **Feature Isolation**: Keep each feature independent and reusable
2. **Dependency Injection**: Register all dependencies in `dependency_injection.dart`
3. **Error Handling**: Use custom exceptions and handle errors in BLoCs
4. **Validation**: Use validators before submitting forms
5. **State Management**: Use BLoC for state management
6. **Testing**: Write tests for BLoCs, repositories, and use cases

## Troubleshooting

### Issue: Command not found
**Solution**: Make sure the package is installed globally:
```bash
dart pub global activate flutter_arch
# Or update PATH to include pub executables
```

### Issue: Port already in use
**Solution**: Use a different device or port:
```bash
flutter run -d <device-id>
```

### Issue: Build fails after running init
**Solution**: Run `flutter pub get` and ensure all dependencies are installed:
```bash
flutter pub get
flutter pub run build_runner build
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues, questions, or suggestions, please create an issue on GitHub.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

---

**Happy coding!** 🚀

