import '../generators/structure_generator.dart';

class InitCommand {
  static Future<void> run() async {
    await StructureGenerator.generate();
  }
}
