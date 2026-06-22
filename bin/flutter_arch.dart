import 'dart:io';

import 'package:flutter_arch/src/commands/feature_command.dart';
import 'package:flutter_arch/src/commands/init_command.dart';

Future<void> main(List<String> args) async {
  try {
    if (args.isEmpty) {
      _showHelp();
      return;
    }

    final command = args.first.toLowerCase();

    switch (command) {
      case 'init':
      case 'create-structure':
        print('🎯 Initializing Flutter Architecture...\n');
        await InitCommand.run();
        break;

      case 'create-feature':
      case 'feature':
        if (args.length < 2) {
          print('❌ Error: Feature name is required');
          print('Usage: flutter_arch create-feature <feature-name>\n');
          _showHelp();
          return;
        }
        await FeatureCommand.run(args[1]);
        break;

      case '--help':
      case '-h':
      case 'help':
        _showHelp();
        break;

      case '--version':
      case '-v':
        print('flutter_arch version 1.0.0');
        break;

      default:
        print('❌ Unknown command: $command\n');
        _showHelp();
    }
  } catch (e) {
    print('❌ Error: $e');
    exit(1);
  }
}

void _showHelp() {
  print('''
╔════════════════════════════════════════════════════════════╗
║         Flutter Architecture CLI - v1.0.0                  ║
╚════════════════════════════════════════════════════════════╝

📚 COMMANDS:

  init, create-structure
    Create the complete Flutter project architecture structure
    with all necessary files, constants, services, and widgets.

    Usage: flutter_arch init

  create-feature, feature <feature-name>
    Generate a new feature with data, domain, and presentation layers
    following clean architecture principles.

    Usage: flutter_arch create-feature <feature-name>
    Example: flutter_arch create-feature auth

  help, --help, -h
    Show this help message

  --version, -v
    Show version information

═══════════════════════════════════════════════════════════════

📖 USAGE:

  1. Create a new Flutter project:
     flutter create my_app
     cd my_app

  2. Initialize the architecture:
     flutter_arch init

  3. Create your first feature:
     flutter_arch create-feature auth

  4. Create additional features:
     flutter_arch create-feature home
     flutter_arch create-feature profile

═══════════════════════════════════════════════════════════════

✨ FEATURES:

  • Complete project structure with best practices
  • Three build flavors (dev, qa, prod)
  • App theme system with colors and text styles
  • Core services (navigation, storage, HTTP client)
  • Network layer with interceptors
  • Dependency injection setup
  • Feature scaffolding with BLoC pattern
  • Pre-built reusable widgets
  • Exception handling
  • Input validation utilities
  • Responsive design extensions

═══════════════════════════════════════════════════════════════

For more information, visit the documentation.
''');
}
