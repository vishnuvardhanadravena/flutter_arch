import 'dart:io';

class PubspecGenerator {
  static Future<void> setup() async {
    print('\n📦 Setting up dependencies...\n');

    print('Current Directory: ${Directory.current.path}');
    print('Pubspec Exists: ${File('pubspec.yaml').existsSync()}');

    if (!File('pubspec.yaml').existsSync()) {
      print('❌ pubspec.yaml not found');
      return;
    }

    await addDependencies();
    await addDevDependencies();

    print('\n🎉 All dependencies installed successfully!');
  }
static Future<void> addDependencies() async {
  final pubspecFile = File('pubspec.yaml');

  if (!await pubspecFile.exists()) {
    print('❌ pubspec.yaml not found');
    return;
  }

  final pubspecContent = await pubspecFile.readAsString();

  final packages = [
    'flutter_bloc',
    'equatable',
    'dio',
    'get_it',
    'go_router',
    'flutter_secure_storage',
    'shared_preferences',
    'connectivity_plus',
    'hive_flutter',
    'internet_connection_checker',
  ];

  for (final package in packages) {
    if (pubspecContent.contains('$package:')) {
      print('✅ Already exists: $package');
      continue;
    }

    print('📦 Adding $package');

    final result = await Process.run(
      'flutter',
      ['pub', 'add', package],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      print('✅ Added $package');
    } else {
      print('❌ Failed: $package');
      print(result.stderr);
    }
  }
}
 static Future<void> addDevDependencies() async {
  final pubspecFile = File('pubspec.yaml');

  if (!await pubspecFile.exists()) {
    print('❌ pubspec.yaml not found');
    return;
  }

  final pubspecContent = await pubspecFile.readAsString();

  final packages = [
    'build_runner',
    'json_serializable',
    'flutter_lints',
  ];

  for (final package in packages) {
    if (pubspecContent.contains('$package:')) {
      print('✅ Dev dependency already exists: $package');
      continue;
    }

    print('📦 Adding dev dependency: $package');

    final result = await Process.run(
      'flutter',
      ['pub', 'add', '--dev', package],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      print('✅ Added dev dependency: $package');
    } else {
      print('❌ Failed: $package');
      print(result.stderr);
    }
  }
}
}
