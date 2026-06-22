/// Example: Using Flutter Architecture CLI
///
/// This example demonstrates how to use the Flutter Architecture CLI
/// to create a new Flutter project with clean architecture.
///
/// STEP 1: Create a new Flutter project
/// ```bash
/// flutter create my_app
/// cd my_app
/// ```
///
/// STEP 2: Initialize the architecture
/// ```bash
/// flutter_arch init
/// ```
/// This creates:
/// - lib/app/ - Application configuration and theme
/// - lib/core/ - Core services, utilities, and widgets
/// - lib/features/ - Feature modules
/// - lib/injection/ - Dependency injection setup
/// - lib/main_dev.dart, lib/main_qa.dart, lib/main_prod.dart - Entry points
///
/// STEP 3: Create a new feature
/// ```bash
/// flutter_arch create-feature auth
/// ```
/// This creates a complete feature with:
/// - data/ - Data models, datasources, and repositories
/// - domain/ - Entities, repositories (abstract), and use cases
/// - presentation/ - BLoCs, screens, and widgets
///
/// STEP 4: Add dependencies to pubspec.yaml
/// See example_pubspec.yaml for the required dependencies.
///
/// STEP 5: Implement your feature
/// - Update auth_remote_datasource.dart with API calls
/// - Implement methods in auth_repository_impl.dart
/// - Update auth_screen.dart with your UI
/// - Register dependencies in dependency_injection.dart
///
/// For more information, see: README.md
///
/// Example Feature Structure (Auth):
/// ```
/// lib/features/auth/
/// ├── data/
/// │   ├── datasource/
/// │   │   └── auth_remote_datasource.dart
/// │   ├── models/
/// │   │   └── auth_model.dart
/// │   └── repositories/
/// │       └── auth_repository_impl.dart
/// ├── domain/
/// │   ├── entities/
/// │   │   └── auth_entity.dart
/// │   ├── repositories/
/// │   │   └── auth_repository.dart
/// │   └── usecases/
/// │       └── get_auth_usecase.dart
/// └── presentation/
///     ├── bloc/
///     │   ├── auth_bloc.dart
///     │   ├── auth_event.dart
///     │   └── auth_state.dart
///     ├── screens/
///     │   └── auth_screen.dart
///     └── widgets/
/// ```
///
/// Example Usage in Code:
/// ```dart
/// // In dependency_injection.dart
/// getIt.registerLazySingleton<AuthBloc>(
///   () => AuthBloc(repository: getIt()),
/// );
///
/// // In your screen
/// BlocBuilder<AuthBloc, AuthState>(
///   builder: (context, state) {
///     if (state is AuthLoadingState) {
///       return const LoadingWidget();
///     } else if (state is AuthLoadedState) {
///       return Text('Logged in as: \${state.user.name}');
///     } else if (state is AuthErrorState) {
///       return ErrorWidget(message: state.message);
///     }
///     return Container();
///   },
/// )
/// ```

void main() {
  print('''
╔════════════════════════════════════════════════════════════╗
║    Flutter Architecture CLI - Getting Started Guide        ║
╚════════════════════════════════════════════════════════════╝

1. Create Flutter Project:
   flutter create my_app
   cd my_app

2. Initialize Architecture:
   flutter_arch init

3. Create Features:
   flutter_arch create-feature auth
   flutter_arch create-feature home
   flutter_arch create-feature profile

4. Add Dependencies:
   - See example_pubspec.yaml for required packages
   - Run: flutter pub get

5. Build & Run:
   flutter run -t lib/main_dev.dart --flavor dev

For more info, run: flutter_arch --help
  ''');
}
