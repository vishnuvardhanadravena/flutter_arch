import 'dart:io';

import '../utils/file_writer.dart';
import 'templates.dart';

class FeatureGenerator {
  static Future<void> generate(String featureName) async {
    final name = featureName.toLowerCase();
    final className = _capitalize(name);

    print('\n🚀 Creating Feature: $className\n');

    // Create all required folders
    final folders = [
      'lib/features/$name/data/datasource',
      'lib/features/$name/data/models',
      'lib/features/$name/data/repositories',
      'lib/features/$name/domain/entities',
      'lib/features/$name/domain/repositories',
      'lib/features/$name/domain/usecases',
      'lib/features/$name/presentation/bloc',
      'lib/features/$name/presentation/screens',
      'lib/features/$name/presentation/widgets',
    ];

    print('📁 Creating feature directories...');
    for (final folder in folders) {
      await Directory(folder).create(recursive: true);
    }
    print('✅ Directories created\n');

    // Domain Layer
    print('📝 Creating domain layer...');
    await FileWriter.create(
      'lib/features/$name/domain/entities/${name}_entity.dart',
      Templates.featureEntity(name),
    );
    await FileWriter.create(
      'lib/features/$name/domain/repositories/${name}_repository.dart',
      Templates.featureRepositoryAbstract(name),
    );
    await FileWriter.create(
      'lib/features/$name/domain/usecases/get_${name}_usecase.dart',
      Templates.featureUsecase(name),
    );
    print('✅ Domain layer created\n');

    // Data Layer
    print('📝 Creating data layer...');
    await FileWriter.create(
      'lib/features/$name/data/models/${name}_model.dart',
      Templates.featureModel(name),
    );
    await FileWriter.create(
      'lib/features/$name/data/datasource/${name}_remote_datasource.dart',
      Templates.featureRemoteDatasource(name),
    );
    await FileWriter.create(
      'lib/features/$name/data/repositories/${name}_repository_impl.dart',
      Templates.featureRepository(name),
    );
    print('✅ Data layer created\n');

    // Presentation Layer
    print('📝 Creating presentation layer...');
    await FileWriter.create(
      'lib/features/$name/presentation/bloc/${name}_event.dart',
      Templates.featureEvent(name),
    );
    await FileWriter.create(
      'lib/features/$name/presentation/bloc/${name}_state.dart',
      Templates.featureState(name),
    );
    await FileWriter.create(
      'lib/features/$name/presentation/bloc/${name}_bloc.dart',
      Templates.featureBloc(name),
    );
    await FileWriter.create(
      'lib/features/$name/presentation/screens/${name}_screen.dart',
      Templates.featureScreen(name),
    );
    print('✅ Presentation layer created\n');

    print('✨ Feature $className created successfully!');
    print('📚 Next steps:');
    print('  1. Update the datasource with your API endpoints');
    print('  2. Implement the repository methods');
    print('  3. Update the UI screen as needed');
    print('  4. Add dependency injection in dependency_injection.dart');
  }

  static String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
