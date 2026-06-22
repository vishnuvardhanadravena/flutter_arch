import '../generators/feature_generator.dart';

class FeatureCommand {
  static Future<void> run(String feature) async {
    await FeatureGenerator.generate(feature);
  }
}
