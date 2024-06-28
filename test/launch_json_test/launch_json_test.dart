import 'package:dart_define_example/launch_json_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    '''Verify the presence of the 'keys_production.json' file in the project''',
    () async {
      final json = await loadJsonFromAssets('keys_production.json');
      final launchJson = LaunchJsonClass.fromJson(json);
      expect(launchJson.isProd, isTrue);
      expect(launchJson.isStage, isFalse);
      expect(launchJson.apiKeyId, isNotEmpty);
    },
  );

  test(
    '''Verify the presence of the 'keys_staging.json' file in the project''',
    () async {
      final json = await loadJsonFromAssets('keys_staging.json');
      final launchJson = LaunchJsonClass.fromJson(json);
      expect(launchJson.isProd, isFalse);
      expect(launchJson.isStage, isTrue);
      expect(launchJson.apiKeyId, isNotEmpty);
    },
  );
}
