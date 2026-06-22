import 'dart:io';

class PubspecGenerator {
  static Future<void> addDependencies() async {
    final packages = [
      'flutter_bloc',
      'equatable',
      'dio',
      'get_it',
      'go_router',
      'flutter_secure_storage',
      'shared_preferences',
      'connectivity_plus',
      'internet_connection_checker',
    ];

    for (final package in packages) {
      final result = await Process.run('flutter', [
        'pub',
        'add',
        package,
      ], runInShell: true);

      if (result.exitCode == 0) {
        print('✅ Added $package');
      } else {
        print('❌ Failed: $package');
        print(result.stderr);
      }
    }

    print('\n🎉 Dependencies added successfully');
  }

  static Future<void> addDevDependencies() async {
    final packages = ['build_runner', 'json_serializable', 'flutter_lints'];

    for (final package in packages) {
      await Process.run('flutter', ['pub', 'add', 'dev:$package']);
    }
  }
}
